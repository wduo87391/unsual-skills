{ self, lib, ... }:
let
  registry = import ./skills.nix;

  # Base module for one package: installs the CLI and symlinks its skill dir
  # into every configured agent skills directory. Carries a stable `key` so the
  # module system deduplicates it when imported multiple times (e.g. directly
  # *and* via a variant like `browser-cli-with-extension`).
  mkBaseModule =
    {
      pkgName,
      skillName ? pkgName,
    }:
    { pkgs, config, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      basePkg = self.packages.${system}.${pkgName};
      tavilyCfg = config.programs.mics-skills.tavily;
      pkg =
        if pkgName == "tavily-cli" then
          import ./tavily-package.nix {
            inherit lib pkgs tavilyCfg;
            tavilyCli = basePkg;
          }
        else
          basePkg;
      skillDir = "${basePkg}/share/skills/${skillName}";
    in
    {
      key = "mics-skills/base/${pkgName}/${skillName}";

      assertions = lib.optionals (pkgName == "tavily-cli") [
        {
          assertion =
            lib.length (
              lib.filter (x: x != null) [
                tavilyCfg.apiKey
                tavilyCfg.apiKeyFile
                tavilyCfg.apiKeyCommand
              ]
            ) <= 1;
          message = "programs.mics-skills.tavily: set at most one of apiKey, apiKeyFile, or apiKeyCommand.";
        }
      ];

      home.packages = [ pkg ];
      home.file = lib.listToAttrs (
        map (
          dir: lib.nameValuePair "${dir}/${skillName}" { source = skillDir; }
        ) config.programs.mics-skills.skillDirs
      );
    };

  mkSkillModule =
    name: def:
    let
      pkgName = def.package or name;
      skillName = def.skill or name;
      extra = def.extra or (_: { });
    in
    {
      key = "mics-skills/${name}";
      imports = [
        ./home-manager-common.nix
        (mkBaseModule { inherit pkgName skillName; })
        (extra { inherit self; })
      ];
    };
in
builtins.mapAttrs mkSkillModule registry
