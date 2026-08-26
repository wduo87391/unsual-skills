# Build the `tvly` package, optionally wrapping it to inject TAVILY_API_KEY.
{
  lib,
  pkgs,
  tavilyCli,
  tavilyCfg,
}:
let
  inherit (tavilyCfg) apiKey apiKeyFile apiKeyCommand;
in
if apiKey != null then
  pkgs.writeShellApplication {
    name = "tvly";
    text = ''
      export TAVILY_API_KEY=${lib.escapeShellArg apiKey}
      exec ${lib.getExe tavilyCli} "$@"
    '';
  }
else if apiKeyFile != null then
  pkgs.writeShellApplication {
    name = "tvly";
    text = ''
      tavily_api_key_file=${lib.escapeShellArg apiKeyFile}

      if [[ ! -r "$tavily_api_key_file" ]]; then
        echo "tvly: Tavily API key file is not readable: $tavily_api_key_file" >&2
        exit 1
      fi

      export TAVILY_API_KEY
      TAVILY_API_KEY="$(${pkgs.coreutils}/bin/cat "$tavily_api_key_file")"

      exec ${lib.getExe tavilyCli} "$@"
    '';
  }
else if apiKeyCommand != null then
  pkgs.writeShellApplication {
    name = "tvly";
    text = ''
      export TAVILY_API_KEY
      TAVILY_API_KEY="$(${pkgs.runtimeShell} -c ${lib.escapeShellArg apiKeyCommand})"

      if [[ -z "$TAVILY_API_KEY" ]]; then
        echo "tvly: apiKeyCommand returned an empty Tavily API key" >&2
        exit 1
      fi

      exec ${lib.getExe tavilyCli} "$@"
    '';
  }
else
  tavilyCli
