{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [ ];
    package = pkgs.ollama-rocm;
  };

  environment.systemPackages = with pkgs; [
    oterm
  ];
}
