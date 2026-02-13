{ config, pkgs, inputs, ... }:
let
  nvidia_offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{ 
  boot = {
    kernelModules = [
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
      "i915"
    ];
    kernelParams = [ 
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_EnableGpuFirmware=0"
    ];
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ 
        "modesetting"
        "nvidia" 
      ];
    };
  }; 

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
      #package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
    };

    nvidia = {
      modesetting.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.latest;

      nvidiaSettings = true;

      open = true;
      powerManagement.enable = false;

      prime = {
         offload = {
           enable = true;
           enableOffloadCmd = true;
         };

         nvidiaBusId = "PCI:1:0:0";
         intelBusId = "PCI:0:2:0";
      };
    };

    nvidia-container-toolkit.enable = true;
  };

  environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    WLR_DRM_DEVICES = "/dev/dri/card2:/dev/dri/card1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #__GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "1";
    GBM_BACKEND = "nvidia-drm";
    #LIBVA_DRIVER_NAME = "nvidia";
  };
}
