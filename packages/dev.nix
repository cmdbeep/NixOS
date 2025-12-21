{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    basedpyright
    bash-language-server
    lua-language-server
    marksman
    markdown-oxide
    nixd
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    package-version-server

    nixfmt
    nodePackages.prettier
    ruff
    shellcheck
    shfmt
    stylua

    nodePackages.eslint
    nodePackages.typescript
    taplo
    tree-sitter

    codespell

    nodejs_24
    nodePackages.pnpm
    uv

    intelli-shell

    godot
    superfile
    unstable.zed-editor
  ];

  programs.git.enable = true;
  programs.lazygit.enable = true;
}
