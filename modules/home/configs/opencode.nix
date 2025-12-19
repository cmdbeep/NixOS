{ ... }:
{
  programs.opencode = {
    enable = true;
    settings = {
      theme = "dracula";
      provider = {
        ollama = {
          npm = "@ai-sdk/openai-compatible";
          name = "Ollama (local)";
          options = {
            baseURL = "http://localhost:11434/v1";
          };
          models = {
            "llama3.2:3b" = {
              name = "Llama 3.2";
            };
          };
        };
      };
    };
  };
}
