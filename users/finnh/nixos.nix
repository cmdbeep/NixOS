{ pkgs, ... }:

{
  users.users.finnh = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "libvirt"
      "kvm"
    ];
    shell = pkgs.zsh;
  };
  home-manager.backupFileExtension = "backup";
}
