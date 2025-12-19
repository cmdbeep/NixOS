{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    # heroic
    mangohud
    prismlauncher
  ];

  programs.gamemode.enable = true;

  programs.steam.enable = true;
}
