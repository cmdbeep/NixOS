{ pkgs, ... }:
{
  services.ollama = {
    enable = true;
    loadModels = [
      "llama3.2:3b"
      "codellama:7b"
      "codellama:13b"
    ];
    package = pkgs.ollama-rocm;
  };
}
