{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [
      "llama3.2:3b"
      "codellama:7b"
    ];
    package = pkgs.ollama-rocm;
  };
}
