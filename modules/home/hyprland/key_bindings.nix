{ inputs, config, ... }:
{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER,Return,exec,kitty"
    "SUPER,F,fullscreen"
    "SUPER,Z,exec,zen"
    "SUPER,Q,killactive"
    "F2,exec.brightnessctl s -8000"
    "F3,exec,brightnessctl s +8000"
  ];
}
