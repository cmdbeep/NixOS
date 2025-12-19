{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-compose-language-service
    lazydocker
    win-virtio
  ];

  virtualisation.docker.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
      runAsRoot = false;
      swtpm.enable = true;
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
}
