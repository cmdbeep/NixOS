{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    mangohud
    prismlauncher
  ];

  programs.gamemode.enable = true;

  programs.steam.enable = true;
}
