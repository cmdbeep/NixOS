{ ... }:
{
  security.rtkit.enable = true;

  services = {
    blueman.enable = false;
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
