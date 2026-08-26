# Home Manager options for Tavily CLI authentication.
{ lib, ... }:
{
  options.programs.mics-skills.tavily = {
    apiKey = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "tvly-…";
      description = ''
        Tavily API key passed to `tvly` via `TAVILY_API_KEY`.

        Prefer {option}`apiKeyFile` or {option}`apiKeyCommand` so the key is
        not stored in the Nix store.
      '';
    };

    apiKeyFile = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      example = "/run/secrets/tavily_api_key";
      description = ''
        File containing the Tavily API key. Its contents are read at runtime and
        exported as `TAVILY_API_KEY` before invoking `tvly`.

        Works well with sops-nix or agenix secret files.
      '';
    };

    apiKeyCommand = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      example = "rbw get tavily-api-key";
      description = ''
        Shell command that prints the Tavily API key to stdout. The output is
        exported as `TAVILY_API_KEY` before invoking `tvly`.
      '';
    };
  };
}
