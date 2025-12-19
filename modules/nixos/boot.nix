{ pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernel.sysctl."kernel.sysrq" = 244;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # boot.plymouth = {
  #   enable = true;
  #   # font = "${pkgs.maple-mono.Normal-NF}/share/fonts/MapleMono-NF-Regular.ttf";
  #   theme = "bgrt";
  #   themePackages = [ pkgs.nixos-bgrt-plymouth ];
  # };

  services.earlyoom.enable = true;
}
