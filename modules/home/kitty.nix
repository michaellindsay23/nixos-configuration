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
      startup_session = "./startup.session";
    };
  };

  home.file.".bashrc".text = ''
    caelestia scheme set -n dynamic
  '';
}
