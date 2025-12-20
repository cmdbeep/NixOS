{ ... }:
let
  dracula = import ../themes/dracula.nix;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF";
      size = 15;
    };
    settings = {
      foreground = "#${dracula.foreground}";
      background = "#${dracula.background}";
      cursor = "#${dracula.foreground}";
      color0 = "#${dracula.background}";
      color8 = "#${dracula.currentLine}";
      color1 = "#${dracula.red}";
      color9 = "#${dracula.red}";
      color2 = "#${dracula.green}";
      color10 = "#${dracula.green}";
      color3 = "#${dracula.yellow}";
      color11 = "#${dracula.yellow}";
      color4 = "#${dracula.purple}";
      color12 = "#${dracula.purple}";
      color5 = "#${dracula.pink}";
      color13 = "#${dracula.pink}";
      color6 = "#${dracula.cyan}";
      color14 = "#${dracula.cyan}";
      color7 = "#${dracula.foreground}";
      color15 = "#${dracula.foreground}";

      window_padding_width = 10;
      hide_window_decorations = false;

      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;

      confirm_os_window_close = 0;
      background_opacity = "0.95";
      enable_audio_bell = false;
      cursor_blink_interval = 0;
    };
  };
}
