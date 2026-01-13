{ inputs, programs, pkgs, ... }:
{
  imports = [ 
    inputs.nixcord.homeModules.nixcord 
  ];

  programs.nixcord = {
    vesktop.enable = true;

    config = {
      plugins = {
        fakeNitro.enable = true;
      };
    };
  };
}
