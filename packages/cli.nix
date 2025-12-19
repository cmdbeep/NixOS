{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    atuin
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
  # programs.neovim.enable = true;
  programs.starship.enable = true;
  programs.tmux.enable = true;
  programs.zoxide.enable = true;
  programs.zsh.enable = true;
}
