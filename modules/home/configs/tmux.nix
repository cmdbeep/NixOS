{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      continuum
      dracula
      sensible
      yank
    ];
    extraConfig = ''
      set -g detach-on-destroy off
    '';
  };
}
