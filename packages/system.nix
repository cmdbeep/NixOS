{ pkgs, self, ... }:
{

  environment.systemPackages = with pkgs; [
    bluetui
    brightnessctl
    btop-rocm
    fastfetch
    hyprpaper
    kdePackages.polkit-kde-agent-1
    rofi

    self.packages.${pkgs.system}.rofi-launcher
    self.packages.${pkgs.system}.rofi-powermenu
  ];

  programs.dconf.enable = true;
  programs.firefox.enable = true;
  programs.htop.enable = true;
  programs.hyprland.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-vcs-plugin
      thunar-media-tags-plugin
    ];
  };
}
