{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "dracula"
      "jetbrains-new-ui-icons"
      "nix"
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
      # colorize_brackets = true;
      use_autoclose = true;
      tab_size = 2;
      auto_indent = true;
      auto_indent_on_paste = true;
      format_on_save = "on";
      lsp = {
        nixd = {
          binary = {
            path = "nixd";
          };
        };
      };
      languages = {
        Nix = {
          language_servers = [ "nixd" ];
          format_on_save = "on";
        };
        "Shell Script" = {
          language_servers = [
            "bash-language-server"
            "shellcheck"
            "shfmt"
          ];
          formatter = [ "language_server" ];
        };
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };
  };
}
