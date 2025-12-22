{ unstable, ... }:
{
  programs.opencode = {
    enable = true;
    package = unstable.opencode;
    settings = {
      theme = "dracula";
      model = "ollama/qwen2.5-coder:7b";
      share = "disabled";

      agent = {
        architect = {
          mode = "primary";
          model = "ollama/qwen2.5-coder:7b";
          prompt = ''
            You are a software architect. When given a task:
            1. Break it down into clear, manageable steps
            2. Consider edge cases and error handling
            3. Think about code organization and modularity
            4. Plan before implementation

            Respond with a structured plan before any code is written.
          '';
          tools = {
            write = false;
            edit = false;
            bash = false;
          };
        };

        build = {
          mode = "primary";
          model = "ollama/qwen2.5-coder:7b";
          prompt = ''
            You are an expert developer. Your role:
            - Implement code following the architect's plan
            - Write clean, idiomatic, and well-commented code
            - Follow language best practices and conventions
            - Create modular, reusable components
            - Handle errors gracefully
            - Write code that is easy to test and maintain

            Always explain your implementation decisions.
          '';
          tools = {
            write = true;
            edit = true;
            bash = true;
          };
        };

        reviewer = {
          description = "Reviews code for quality, security, and best practices";
          mode = "subagent";
          model = "ollama/qwen2.5-coder:7b";
          prompt = ''
            You are a senior code reviewer. Review code for:

            Security:
            - Input validation and sanitization
            - Authentication/authorization issues
            - SQL injection, XSS, CSRF vulnerabilities
            - Secure data handling

            Performance:
            - Algorithm efficiency (time/space complexity)
            - Unnecessary loops or redundant operations
            - Resource management (memory leaks, file handles)
            - Database query optimization

            Maintainability:
            - Code clarity and readability
            - Proper naming conventions
            - DRY principle adherence
            - Documentation and comments
            - Error handling completeness

            Best Practices:
            - Language idioms and conventions
            - Design patterns usage
            - Testing considerations
            - Potential edge cases

            Provide specific, actionable feedback with examples.
          '';
          tools = {
            write = false;
            edit = false;
            bash = false;
          };
        };

        tester = {
          description = "Generates tests and validates code";
          mode = "subagent";
          model = "ollama/qwen2.5-coder:7b";
          prompt = ''
            You are a test engineer. Your responsibilities:
            - Write comprehensive unit tests
            - Cover edge cases and error conditions
            - Test both happy paths and failure scenarios
            - Ensure good test coverage
            - Use appropriate testing frameworks
            - Write clear test descriptions

            Focus on making tests readable, maintainable, and effective.
          '';
          tools = {
            write = true;
            edit = false;
            bash = true;
          };
        };

        debugger = {
          description = "Diagnoses and fixes issues in code";
          mode = "subagent";
          model = "ollama/qwen2.5-coder:7b";
          prompt = ''
            You are a debugging expert. When investigating issues:
            1. Analyze error messages and stack traces carefully
            2. Identify root causes, not just symptoms
            3. Consider context and environment factors
            4. Suggest targeted fixes with explanations
            5. Recommend preventive measures

            Think systematically and explain your reasoning.
          '';
          tools = {
            write = false;
            edit = true;
            bash = true;
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
          "qwen2.5-coder:7b" = {
            name = "qwen2.5-coder:7b";
          };
        };
      };
    };
  };
}
