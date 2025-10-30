{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      mesa
      libva
      libvdpau-va-gl
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      vulkan-tools
      mesa.opencl  # Enables Rusticl (OpenCL) support
      rocmPackages.clr.icd
    ];
  };

  hardware.bluetooth.enable = false;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

}
