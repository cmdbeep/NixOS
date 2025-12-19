{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      continuum
      dracula
      sensible
      yank
    ];
  };
}
