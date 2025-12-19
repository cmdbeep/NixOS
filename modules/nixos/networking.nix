{ ... }:
{

  # networking.bridges.br0.interfaces = [ "enp3s0" ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # networking.interfaces.br0.useDHCP = true;

  networking.networkmanager.enable = true;

  networking.hostName = "nixos";
}
