# Composite home-manager module: install `tvly` once and symlink all Tavily
# agent skills. Prefer this over importing each per-skill module separately.
self: {
  lib,
  pkgs,
  config,
  ...
}:
let
  tavilySkillNames = [
    "tavily-best-practices"
    "tavily-cli"
    "tavily-crawl"
    "tavily-dynamic-search"
    "tavily-extract"
    "tavily-map"
    "tavily-research"
    "tavily-search"
  ];

  baseCli = self.packages.${pkgs.stdenv.hostPlatform.system}.tavily-cli;
  tavilyCfg = config.programs.mics-skills.tavily;

  tvly = import ./tavily-package.nix {
    inherit lib pkgs tavilyCfg;
    tavilyCli = baseCli;
  };

  configuredSources = lib.filter (x: x != null) [
    tavilyCfg.apiKey
    tavilyCfg.apiKeyFile
    tavilyCfg.apiKeyCommand
  ];
in
{
  imports = [
    ./home-manager-common.nix
    ./tavily-options.nix
  ];

  config = {
    assertions = [
      {
        assertion = lib.length configuredSources <= 1;
        message = "programs.mics-skills.tavily: set at most one of apiKey, apiKeyFile, or apiKeyCommand.";
      }
    ];

    home.packages = lib.mkAfter [ tvly ];

    home.file = lib.listToAttrs (
      lib.concatMap (
        dir:
        map (name: {
          name = "${dir}/${name}";
          value.source = "${baseCli}/share/skills/${name}";
        }) tavilySkillNames
      ) config.programs.mics-skills.skillDirs
    );
  };
}
