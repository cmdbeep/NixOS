{ ... }:
{
  imports = [
    ../../modules/home/configs/atuin.nix
    ../../modules/home/configs/ghostty.nix
    ../../modules/home/configs/hyprland.nix
    ../../modules/home/configs/intelli-shell.nix
    ../../modules/home/configs/kitty.nix
    # ../../modules/home/configs/neovim.nix
    ../../modules/home/configs/nushell.nix
    ../../modules/home/configs/opencode.nix
    ../../modules/home/configs/radicle.nix
    ../../modules/home/configs/starship.nix
    ../../modules/home/configs/tmux.nix
    ../../modules/home/configs/zed-editor.nix
    ../../modules/home/configs/zoxide.nix
    ../../modules/home/configs/zsh.nix
    ../../modules/home/themes/theming.nix
  ];

  home = {
    username = "finnh";
    homeDirectory = "/home/finnh";
    stateVersion = "25.11";

    file = {
      ".local/share/applications/rofi.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Rofi
        Exec=rofi
        NoDisplay=true
      '';

      ".local/share/applications/rofi-theme-selector.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Rofi Theme Selector
        Exec=rofi-theme-selector
        NoDisplay=true
      '';

      ".local/share/applications/bluetui.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Bluetui
        Exec=bluetui
        NoDisplay=true
      '';
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identityFile = "/home/finnh/.ssh/github";
        identitiesOnly = true;
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "cmdbeep";
    userEmail = "hasse.finn@icloud.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
