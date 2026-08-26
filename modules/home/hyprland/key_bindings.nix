{ inputs, config, lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';                     # execute
  global = gl: ''hl.dsp.global("${gl}")'';
  mvws = ws: ''hl.dsp.focus({ workspace = "${ws}" })'';          # move workspace
  mvwd = ws: ''hl.dsp.window.move({ workspace = "${ws}" })'';    # move window
  mvwddr = dr: ''hl.dsp.window.move({ direction = "${dr}" })'';  # move window direction
  fs = mode: ''hl.dsp.window.fullscreen({ mode = "${mode}" })''; # fullscreen
  focusdr = dr: ''hl.dsp.focus({ direction = "${dr}" })'';       # change focus
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Show all keybinds
      (bind "SUPER + F1" (exec "show-keybindings"))

      # Programs
      (bind "SUPER + Return" (exec "kitty"))
      (bind "SUPER + Z" (exec "zen"))

      # Open caelestia launcher
      (bind "SUPER + Space" (global "caelestia:launcher"))

      # Window state
      (bind "SUPER + Q" "hl.dsp.window.close()")
      (bind "SUPER + F" (fs "maximized"))
      (bind "SUPER + V" "hl.dsp.window.float({})")

      # Brightness
      (bind "SUPER + F2" (exec "brightnessctl s 5%-"))
      (bind "SUPER + F3" (exec "brightnessctl s 5%+"))

      # Switch workspaces with mainMod + [0-9]
      (bind "SUPER + 1" (mvws "1"))
      (bind "SUPER + 2" (mvws "2"))
      (bind "SUPER + 3" (mvws "3"))
      (bind "SUPER + 4" (mvws "4"))
      (bind "SUPER + 5" (mvws "5"))
      (bind "SUPER + 6" (mvws "6"))
      (bind "SUPER + 7" (mvws "7"))
      (bind "SUPER + 8" (mvws "8"))
      (bind "SUPER + 9" (mvws "9"))
      (bind "SUPER + 0" (mvws "10"))

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      (bind "SUPER + SHIFT + 1" (mvwd "1"))
      (bind "SUPER + SHIFT + 2" (mvwd "2"))
      (bind "SUPER + SHIFT + 3" (mvwd "3"))
      (bind "SUPER + SHIFT + 4" (mvwd "4"))
      (bind "SUPER + SHIFT + 5" (mvwd "5"))
      (bind "SUPER + SHIFT + 6" (mvwd "6"))
      (bind "SUPER + SHIFT + 7" (mvwd "7"))
      (bind "SUPER + SHIFT + 8" (mvwd "8"))
      (bind "SUPER + SHIFT + 9" (mvwd "9"))
      (bind "SUPER + SHIFT + 0" (mvwd "10"))

      #Change window focus
      (bind "SUPER + up" (focusdr "up"))
      (bind "SUPER + right" (focusdr "right"))
      (bind "SUPER + down" (focusdr "down"))
      (bind "SUPER + left" (focusdr "left"))
      
      # Mouse binds
      (bind "SUPER + mouse:272" "hl.dsp.window.drag()")
      (bind "SUPER + mouse:273" "hl.dsp.window.resize()")
    ];
  };
}
