{ pkgs, inputs, ... }:
{ 
  boot = {
    kernelModules = [ "nvidia" "nvidia_drm" ];
    kernelParams = [ 
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_EnableGpuFirmware=0"
    ];
  };

  services = {
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      videoDrivers = [ "nvidia" ];
    };
  }; 

  hardware = {
    graphics = {
      enable = true;
      package = 
        inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
    };

    nvidia = {
      modesetting.enable = true;
      open = false;
      powerManagement.enable = true;
      nvidiaSettings = true;
    };
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "vulkan";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
  };
}
