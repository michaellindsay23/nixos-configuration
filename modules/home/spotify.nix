{ inputs, pkgs, ... }:
{
  imports = [
    inputs.spicetify.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
  };
}
