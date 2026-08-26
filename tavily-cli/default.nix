{
  lib,
  python3Packages,
  fetchurl,
  callPackage,
}:

let
  tavily-python = callPackage ./tavily-python.nix { };
in
python3Packages.buildPythonApplication rec {
  pname = "tavily-cli";
  version = "0.1.6";
  pyproject = true;

  src = fetchurl {
    url = "https://files.pythonhosted.org/packages/66/b9/2d7f851561db61539922b1a6d1cf978caba89bda6c2b873397acc63c65a3/tavily_cli-${version}.tar.gz";
    hash = "sha256-TnIgLBl3eUDydAFBuwUCT1js1z4CD/qi22d8FH1EIaM=";
  };

  build-system = with python3Packages; [ hatchling ];

  dependencies = with python3Packages; [
    certifi
    click
    httpx
    psutil
    requests
    rich
    tavily-python
    urllib3
  ];

  doCheck = false;

  postInstall = ''
    mkdir -p $out/share/skills
    cp -r ${./skills}/* $out/share/skills/
  '';

  meta = {
    description = "CLI for Tavily search, extract, crawl, map, and research";
    homepage = "https://github.com/tavily-ai/tavily-cli";
    license = lib.licenses.mit;
    mainProgram = "tvly";
  };
}
