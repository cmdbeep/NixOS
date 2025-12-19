{ ... }:
let
  dracula = import ../themes/dracula.nix;
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;
    settings = {
      palette = "dracula";
      character = {
        error_symbol = "[[](red) ](pink)";
        success_symbol = "[[](purple) ](pink)";
        vimcmd_symbol = "[[](purple) ](pink)";
      };
      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        style = "bold yellow";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        conflicted = "[\${count}](red)";
        untracked = "[\${count}](cyan)";
        stashed = "[\${count}](yellow)";
        modified = "[\${count}](orange)";
        staged = "[\${count}](green)";
        renamed = "[\${count}](pink)";
        deleted = "[\${count}](red)";
      };

      username = {
        style_user = "bold purple";
        style_root = "bold red";
        format = "[$user]($style) ";
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[@$hostname](bold pink) ";
        disabled = false;
      };

      cmd_duration = {
        style = "bold yellow";
        format = "took [$duration]($style) ";
      };

      time = {
        disabled = true;
        style = "bold comment";
        format = "[$time]($style) ";
      };

      palettes.dracula = {
        background = "#${dracula.background}";
        currentLine = "#${dracula.currentLine}";
        foreground = "#${dracula.foreground}";
        comment = "#${dracula.comment}";
        cyan = "#${dracula.cyan}";
        green = "#${dracula.green}";
        orange = "#${dracula.orange}";
        pink = "#${dracula.pink}";
        purple = "#${dracula.purple}";
        red = "#${dracula.red}";
        yellow = "#${dracula.yellow}";
      };
    };
  };
}
