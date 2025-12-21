{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernel.sysctl."kernel.sysrq" = 244;

  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/vda";
      # device = "nodev";
      # efiSupport = true;
      useOSProber = true;
    };
    # efi.canTouchEfiVariables = true;
  };

  services.earlyoom.enable = true;
}
