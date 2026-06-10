{ ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      autoupdate = false;
      permission."*" = "ask";
      model = "ollama/gemma4:31b-cloud";
      provider.ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama";
        options.baseURL = "http://127.0.0.1:11434/v1";
        models."gemma4:31b-cloud" = {
          name = "Gemma 4";
          modalities = {
            input = [
              "text"
              "image"
            ];
            output = [ "text" ];
          };
        };
      };
    };
  };
}
