{pkgs, ...}:
{
  home.packages = with pkgs; [
    godot_4_7 # latest stable as of Sept 2026
  ];
}
