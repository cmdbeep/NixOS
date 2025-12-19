{ ... }:
let
  dracula = import ../themes/dracula.nix;
in
{
  programs.atuin = {
    enable = true;
    daemon.enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = {
      auto_sync = true;
      network_connect_timeout = 60;
      network_timeout = 60;
      search_mode = "fuzzy";
      style = "auto";
      sync_address = "localhost:8888";
      sync_frequency = "30m";
      theme = {
        name = "dracula";
      };
      workspaces = true;
      workspaces_auto = true;
    };

    themes = {
      "dracula" = {
        theme.name = "dracula";
        colors = {
          background = "#${dracula.background}";
          foreground = "#${dracula.foreground}";
          border = "#${dracula.purple}";
          selected_bg = "#${dracula.currentLine}";
          selected_fg = "#${dracula.foreground}";
          prompt = "#${dracula.pink}";
          info = "#${dracula.cyan}";
          error = "#${dracula.red}";
          hint = "#${dracula.comment}";
          command = "#${dracula.green}";
          arg = "#${dracula.cyan}";
          flag = "#${dracula.orange}";
          time = "#${dracula.yellow}";
          duration = "#${dracula.purple}";
        };
      };
    };
  };
}
