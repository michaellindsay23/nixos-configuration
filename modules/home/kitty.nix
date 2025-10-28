{ inputs, pkgs, config, lib, ... }:
{
  home.packages = [
    pkgs.yazi
  ];

  programs.kitty = {
    enable = true;

    settings = {
      dynamic_background_opacity = true;
      background_opacity = 0.8;
    };
  };

  home.file.".bashrc".text = ''
    caelestia scheme set -n dynamic
    alias "sh ~/nixos-configuration/rebuild.sh" rebuild
  '';
}
