{ inputs, pkgs, config, ... }:
{
  home.packages = with pkgs; [
    kitty
    brightnessctl
    wl-clipboard
    hyprshot
    satty
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    systemd.enable = true; 

    settings = {
      monitor = [
        "eDP-1, 1920x1200@60,0x0,1"
	      #"HDMI-A-2, 1920x1080@60,1920x0,1"
	      #", preferred, auto, 1, mirror, eDP-1"
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
          "hyprdynamicmonitors run"
        ];
      };

      general = {
        gaps_out = 10;
      };

      decoration = {
        rounding = 5;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
    };

    extraConfig = ''
      source = ~/.config/hypr/monitors.conf
    '';
  };
}
