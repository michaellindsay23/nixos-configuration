{ inputs, pkgs, ... }:
{
  imports = [
    inputs.spicetify.nixosModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
  };
}
