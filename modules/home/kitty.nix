{ inputs, pkgs, config, lib, ... }:
{
  home.packages = with pkgs; [
    yazi
  ];

  programs.kitty = {
    enable = true;

    settings = {
      dynamic_background_opacity = true;
      background_opacity = 0.8;

      
    };
  };

  home.file.".bashrc".text = ''
    # Set shell theme automatically based on wallpaper
    caelestia scheme set -n dynamic

    fish
  '';
}
