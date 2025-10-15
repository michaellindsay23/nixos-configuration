{ inputs, config, ... }:
let
  mainMod = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Show all keybinds
      "${mainMod}, F1, exec, show-keybindings"

      # Programs
      "${mainMod}, Return, exec, kitty"
      "${mainMod}, Z, exec, zen"

      # Open caelestia launcher
      "${mainMod}, Space, global, caelestia:launcher"

      # Windows
      "${mainMod}, Q, killactive"
      "${mainMod}, F, fullscreen"
      "${mainMod}, Tab, cycleNext"
      "${mainMod}, V, togglefloating"

      # Brightness
      "${mainMod}, F2, exec, brightnessctl s 5%-"
      "${mainMod}, F3, exec, brightnessctl s 5%+"

      # Switch workspaces with mainMod + [0-9]
      "${mainMod}, 1, workspace, 1"
      "${mainMod}, 2, workspace, 2"
      "${mainMod}, 3, workspace, 3"
      "${mainMod}, 4, workspace, 4"
      "${mainMod}, 5, workspace, 5"
      "${mainMod}, 6, workspace, 6"
      "${mainMod}, 7, workspace, 7"
      "${mainMod}, 8, workspace, 8"
      "${mainMod}, 9, workspace, 9"
      "${mainMod}, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "${mainMod} SHIFT, 1, movetoworkspace, 1"
      "${mainMod} SHIFT, 2, movetoworkspace, 2"
      "${mainMod} SHIFT, 3, movetoworkspace, 3"
      "${mainMod} SHIFT, 4, movetoworkspace, 4"
      "${mainMod} SHIFT, 5, movetoworkspace, 5"
      "${mainMod} SHIFT, 6, movetoworkspace, 6"
      "${mainMod} SHIFT, 7, movetoworkspace, 7"
      "${mainMod} SHIFT, 8, movetoworkspace, 8"
      "${mainMod} SHIFT, 9, movetoworkspace, 9"
      "${mainMod} SHIFT, 0, movetoworkspace, 10"
    ];

    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, mouse:273, resizewindow"  
    ];
  };

  wayland.input.touchpad.clickfinger_behavior = true;
}
