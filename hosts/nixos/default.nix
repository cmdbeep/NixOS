{ ... }:
{
  imports = [

    ./hardware.nix
    ./hardware-configuration.nix

    # System modules
    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/services.nix
    # ../../modules/nixos/virtualisation.nix

    # Package groups
    ../../packages/cli.nix
    ../../packages/dev.nix
    ../../packages/fonts.nix
    ../../packages/gaming.nix
    ../../packages/multimedia.nix
    ../../packages/system.nix

    # Services
    # ../../services/ollama.nix
    # ../../services/radicle.nix

    # Users
    ../../users/finnh/nixos.nix
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  networking.hostName = "nixos";
  system.stateVersion = "25.11";

}
