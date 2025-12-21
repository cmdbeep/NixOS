{ ... }:
{
  # hardware.amdgpu.opencl.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  };

  # zramSwap = {
  #   enable = true;
  #   algorithm = "lz4";
  # };
}
