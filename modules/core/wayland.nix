{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  }; 

  services.greetd = {
    enable = true;
    settings.default_session.command = "Hyprland";
  };

  wayland.windowManager.hyprland = {
    enable = true;

#    plugins = [
#      inputs.hyprland-plugins.packages."{pkgs.system}".borders-plus-plus
#    ];

#    settings = {
#      general = with config.colorScheme.colors; {
#        "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
#        "col.inactivve_border" = "rgba(${base00}ff)";
#      };
#    };
  };
}
