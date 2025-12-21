{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # atuin
    chess-tui
    eza
    fd
    fzf
    lsof
    ncdu
    nushell
    ripgrep
    tealdeer
    tree
  ];

  programs.bat.enable = true;
  programs.starship.enable = true;
  programs.tmux.enable = true;
  programs.zoxide.enable = true;
  programs.zsh.enable = true;
}
