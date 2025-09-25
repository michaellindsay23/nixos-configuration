{ inputs, pkgs, username, ... }:
{
  services.xserver.enable = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  }; 
}
