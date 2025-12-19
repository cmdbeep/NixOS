{ ... }:
let
  dracula = import ../themes/dracula.nix;
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''

      alias nrs='nixos-rebuild switch '
      alias ss='sudo '
      alias f='--flake'

      typeset -A ZSH_HIGHLIGHT_STYLES

      ZSH_HIGHLIGHT_STYLES[default]='fg=#${dracula.foreground}'
      ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#${dracula.red}'
      ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#${dracula.pink}'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=#${dracula.green}'
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=#${dracula.cyan}'
      ZSH_HIGHLIGHT_STYLES[function]='fg=#${dracula.green}'
      ZSH_HIGHLIGHT_STYLES[command]='fg=#${dracula.green}'
      ZSH_HIGHLIGHT_STYLES[precommand]='fg=#${dracula.green},italic'
      ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#${dracula.pink}'
      ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#${dracula.green}'
      ZSH_HIGHLIGHT_STYLES[path]='fg=#${dracula.foreground},underline'
      ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#${dracula.pink},underline'
      ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#${dracula.foreground},underline'
      ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#${dracula.pink},underline'
      ZSH_HIGHLIGHT_STYLES[globbing]='fg=#${dracula.purple}'
      ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#${dracula.purple}'
      ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#${dracula.orange}'
      ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#${dracula.orange}'
      ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#${dracula.purple}'
      ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#${dracula.yellow}'
      ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#${dracula.yellow}'
      ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#${dracula.cyan}'
      ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#${dracula.cyan}'
      ZSH_HIGHLIGHT_STYLES[assign]='fg=#${dracula.foreground}'
      ZSH_HIGHLIGHT_STYLES[redirection]='fg=#${dracula.pink}'
      ZSH_HIGHLIGHT_STYLES[comment]='fg=#${dracula.comment}'
      ZSH_HIGHLIGHT_STYLES[arg0]='fg=#${dracula.green}'

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#${dracula.comment}'
    '';
  };
}
