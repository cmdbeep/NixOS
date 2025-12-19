{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # language servers
    bash-language-server
    intelli-shell
    lua-language-server
    marksman
    markdown-oxide
    nixd
    nixfmt
    shellcheck
    shfmt
    taplo

    # other tools
    radicle-tui
    superfile
    godot
    zed-editor
  ];

  programs.git.enable = true;
  programs.lazygit.enable = true;
}
