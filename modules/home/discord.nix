{ inputs, programs, pkgs, ... }:
{
  imports = [ 
    inputs.nixcord.homeModules.nixcord 
  ];

  programs.nixcord = {
    enable = true;
  };
}
