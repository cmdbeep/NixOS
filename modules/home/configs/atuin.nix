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
      style = "full";
      sync_address = "localhost:8888";
      sync_frequency = "30m";
      theme = {
        name = "dracula";
      };
      workspaces = true;
      workspaces_auto = true;

      enter_accept = true;
      keymap_mode = "auto";
    };

    themes = {
      dracula = {
        theme.name = "dracula";
        colors = {
          AlertInfo = "#${dracula.cyan}";
          AlertWarn = "#${dracula.orange}";
          AlertError = "#${dracula.red}";

          Annotation = "#${dracula.comment}";
          Base = "#${dracula.foreground}";
          Guidance = "#${dracula.purple}";
          Important = "#${dracula.pink}";
          Title = "#${dracula.green}";
        };
      };
    };
  };
}
