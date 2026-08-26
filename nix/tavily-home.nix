# Composite home-manager module: install `tvly` once and symlink all Tavily
# agent skills. Prefer this over importing each per-skill module separately.
{ self, lib, pkgs, config, ... }:
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
in
{
  imports = [ ./home-manager-common.nix ];

  config =
    let
      cfg = config.programs.mics-skills;
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.tavily-cli;
    in
    {
      home.packages = lib.mkAfter [ pkg ];

      home.file = lib.listToAttrs (
        lib.concatMap (
          dir:
          map (name: {
            name = "${dir}/${name}";
            value.source = "${pkg}/share/skills/${name}";
          }) tavilySkillNames
        ) cfg.skillDirs
      );
    };
}
