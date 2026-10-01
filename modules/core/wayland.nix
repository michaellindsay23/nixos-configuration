{ inputs, pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [
    egl-wayland
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
  ];

  #services.xserver.enable = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    config = {
      common.default = [ "*" ];
    };
  }; 
}
