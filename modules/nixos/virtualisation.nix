{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker-compose
    docker-compose-language-service
    lazydocker
    virtio-win
  ];

  virtualisation.docker.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
}
