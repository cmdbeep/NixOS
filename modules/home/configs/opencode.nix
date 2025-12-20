{ unstable, ... }:
{
  programs.opencode = {
    enable = true;
    package = unstable.opencode;
    settings = {
      theme = "dracula";

      model = "ollama/codellama:7b";

      agent = {
        build = {
          mode = "primary";
          model = "ollama/codellama:7b";
          prompt = "{file:./prompts/build.txt}";
          tools = {
            write = true;
            edit = true;
            bash = true;
          };
        };
        plan = {
          mode = "primary";
          model = "ollama/codellama:13b";
          tools = {
            write = false;
            edit = false;
            bash = false;
          };
        };
        code-reviewer = {
          description = "Reviews code for best practices and potential issues";
          mode = "subagent";
          model = "ollama/codellama:13b";
          prompt = "You are a code reviewer. Focus on security, performance, and maintainability.";
          tools = {
            write = false;
            edit = false;
          };
        };
      };

      provider.ollama = {
        npm = "@ai-sdk/openai-compatible";
        name = "Ollama (local)";
        options = {
          baseURL = "http://localhost:11434/v1";
        };
        models = {
          "codellama:7b" = {
            name = "codellama:7b";
          };
          "codellama:13b" = {
            name = "codellama:13b";
          };
        };
      };
    };
  };
}
