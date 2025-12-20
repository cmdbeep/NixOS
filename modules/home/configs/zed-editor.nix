{ unstable, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;

    extensions = [
      "dracula"
      "html"
      "jetbrains-new-ui-icons"
      "nix"
      "nu"
      "opencode"
      "react-typescript-snippets"
    ];

    userKeymaps = [
      {
        bindings = {
          "ctrl-shift-o" = [
            "agent::NewExternalAgentThread"
            {
              agent = {
                custom = {
                  name = "OpenCode";
                  command = {
                    command = "opencode";
                    args = [ "acp" ];
                  };
                };
              };
            }
          ];
        };
      }
    ];

    userSettings = {
      theme = {
        mode = "dark";
        light = "Dracula Light (Alucard)";
        dark = "Dracula";
      };
      icon_theme = "JetBrains New UI Icons (Dark)";

      buffer_font_family = "Maple Mono NF";
      buffer_font_size = 20;
      ui_font_family = "Inter";
      ui_font_size = 16;

      hide_mouse = "on_typing_and_movement";
      selection_highlight = true;
      rounded_selection = true;
      colorize_brackets = true;
      use_autoclose = true;

      tab_size = 2;
      auto_indent = true;
      auto_indent_on_paste = true;

      format_on_save = "on";
      title_bar = {
        show_sign_in = false;
      };
      tab_bar = {
        show = false;
      };

      lsp = {
        basedpyright = {
          settings = {
            basedpyright.analysis = {
              diagnosticMode = "workspace";
              inlayHints = {
                callArgumentNames = false;
              };
            };
          };
        };
        bash-language-server = {
          binary = {
            path = "bash-language-server";
            arguments = [ "start" ];
          };
        };
        eslint = {
          binary = {
            path = "vscode-eslint-language-server";
            arguments = [ "--stdio" ];
          };
        };
        markdown-oxide = {
          binary = {
            path = "markdown-oxide";
          };
        };
        marksman = {
          binary = {
            path = "marksman";
            arguments = [ "server" ];
          };
        };
        nixd = {
          binary = {
            path = "nixd";
          };
        };
        typescript-language-server = {
          binary = {
            path = "typescript-language-server";
            arguments = [ "--stdio" ];
          };
        };
      };

      languages = {
        JavaScript = {
          language_servers = [
            "typescript-language-server"
            "eslint"
          ];
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
          tab_size = 2;
        };

        Markdown = {
          language_servers = [
            "markdown-oxide"
            "marksman"
          ];
          format_on_save = "on";
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
                "--parser"
                "markdown"
              ];
            };
          };
          code_actions_on_format = {
            "source.fixAll" = true;
          };
          tab_size = 2;
          soft_wrap = "editor_width";
        };
        Nix = {
          language_servers = [ "nixd" ];
          format_on_save = "on";
        };
        Python = {
          language_servers = [
            "basedpyright"
          ];
          formatter = {
            external = {
              command = "ruff";
              arguments = [
                "--stdin-filename"
                "{buffer_path}"
                "-"
              ];
            };
          };
        };
        "Shell Script" = {
          language_servers = [
            "bash-language-server"
          ];
          formatter = {
            external = {
              command = "shfmt";
              arguments = [
                "--filename"
                "{buffer_path}"
                "--indent"
                "2"
              ];
            };
          };
        };
        "TSX" = {
          language_servers = [
            "typescript-language-server"
            "eslint"
          ];
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
        };
        "TypeScript" = {
          language_servers = [
            "typescript-language-server"
            "eslint"
          ];
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
          tab_size = 2;
        };
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      language_models = {
        ollama = {
          api_url = "http://localhost:11434";
        };
      };
    };
  };
}
