{ ... }:
{
  security.rtkit.enable = true;

  services = {
    blueman.enable = true;
    printing.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };
}
