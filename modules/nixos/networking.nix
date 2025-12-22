{ ... }:
{

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      8776 # Radicle seed node
      11434 # Ollama
    ];
    allowedUDPPorts = [ ];
  };

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";
}
