{
  pkgs,
  self,
  wallpaper,
  ...
}:
let
  dracula = import ../themes/dracula.nix;
  rofi-collection = self.packages.${pkgs.system}.rofi-collection;
in
{

  home.file.".config/rofi" = {
    source = "${rofi-collection}/files";
    recursive = true;
  };

  home.file.".local/share/fonts/rofi" = {
    source = "${rofi-collection}/fonts";
    recursive = true;
    onChange = ''
      ${pkgs.fontconfig}/bin/fc-cache -f
    '';
  };

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = ,${wallpaper}
    splash = false
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ ];
    settings = {
      "$mod" = "SUPER";
      exec-once = [
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"
        "hyprctl setcursor phinger-cursors-dark 20"
        "hyprpaper"
      ];
      general = {
        monitor = "DP-1, 3440x1440@120, 0x0, 1";
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgb(${dracula.purple}) rgb(${dracula.pink}) 45deg";
        "col.inactive_border" = "rgb(${dracula.currentLine})";
        layout = "dwindle";
      };
      decoration = {
        rounding = 15;
        rounding_power = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };
      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "smooth, 0.25, 0.1, 0.25, 1"
          "overshot, 0.68, -0.6, 0.32, 1.6"
          "bounce, 1, 1.6, 0.1, 0.85"
        ];

        animation = [
          "windows, 1, 8, myBezier, popin 80%"
          "windowsIn, 1, 8, myBezier, popin 80%"
          "windowsOut, 1, 8, myBezier, popin 80%"
          "windowsMove, 1, 8, myBezier, slide"

          "border, 1, 20, smooth"
          "borderangle, 1, 200, smooth, loop"

          "fade, 1, 10, smooth"
          "fadeSwitch, 1, 10, smooth"
          "fadeShadow, 1, 10, smooth"
          "fadeDim, 1, 10, smooth"

          "workspaces, 1, 8, bounce, slide"

          "layers, 1, 8, smooth, popin 90%"
        ];
      };
      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        vfr = true;
      };

      bind = [
        "$mod, T, exec, kitty"
        "$mod, B, exec, firefox"
        "$mod, E, exec, thunar"
        "$mod, D, exec, rofi-launcher"
        "$mod, M, exec, rofi-powermenu"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, Pos1, workspace, 1"
        "$mod, Ende, workspace, 5"
        "$mod, Prior, workspace, e-1"
        "$mod, Next, workspace, e+1"

        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        "$mod CTRL, left, resizeactive, -40 0"
        "$mod CTRL, right, resizeactive, 40 0"
        "$mod CTRL, up, resizeactive, 0 -40"
        "$mod CTRL, down, resizeactive, 0 40"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
