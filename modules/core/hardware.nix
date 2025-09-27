{ pkgs, inputs, ... }:
{
  services.xserver = {
    enable = false;
    videoDrivers = [ "nvidia" ];
  }; 

  hardware = {
    graphics = {
      enable = true;
      package = 
        inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
    };
      
    nvidia= {
      modsetting.enable = true;
      open = true;
      powerManagement.enable = true;
    };
  };
}
