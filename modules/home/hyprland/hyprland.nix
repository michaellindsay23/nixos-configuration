{ inputs, pkgs, config, ... }:
{
  home.packages = with pkgs; [
    waybar
    kitty
    brightnessctl
    wl-clipboard
    swaybg
    nwg-look
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    systemd.enable = true; 

  
#    plugins = [
#      inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
#    ];

    settings = {
      monitor = [
        "eDP-1, 1920x1200@60,0x0,1"
	"HDMI-A-2, 1920x1080@60,1920x0,1"
	#", preferred, auto, 1"
      ];

      env = [
        "GLX_VENDOR_LIBRARY_NAME, nvidia" 
        "GBM_BACKEND, nvidia-drm"
      ];

      input = {
        kb_layout = "us";
        touchpad = {
          natural_scroll = "yes";
          tap-to-click = "yes";
        };

        exec-once = [
          "caelestia-shell"
        ];
      };

      general = {
        gaps_out = 10;
      };

      decoration = {
        rounding = 5;
      };

#      general = with config.colorScheme.colors; {
#        "col.active_border" = "rgba(${base0E}ff) rgba(${base09}ff) 60deg";
#        "col.inactivve_border" = "rgba(${base00}ff)";
#      };
    };
  };
}
