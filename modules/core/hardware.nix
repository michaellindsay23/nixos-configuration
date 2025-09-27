{ pkgs, inputs, ... }:
{
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];

  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  }; 

  hardware = {
    graphics = {
      enable = true;
      package = 
        inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
    };

    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
      
    nvidia= {
      modesetting.enable = true;
      open = true;
      powerManagement.enable = true;
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
