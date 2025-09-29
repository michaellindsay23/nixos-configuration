{ inputs, config, ... }:
let
  mainMod = "ALT";
in
{
  wayland.windowManager.hyprland.settings.bind = [
    #show all keybinds
    "${mainMod}, F1, exec, show-keybindings"

    #programs
    "${mainMod}, Return, exec, kitty"
    "${mainMod}, Space, exec, fuzzel"
    "${mainMod}, Z, exec, zen"

    #windows
    "${mainMod}, Q, killactive"
    "${mainMod}, F, fullscreen"
    "${mainMod}, Tab, cycleNext"

    #brightness
    "${mainMod}, F2, exec, brightnessctl s 5%-"
    "${mainMod}, F3, exec, brightnessctl s 5%+"
  ];
}
