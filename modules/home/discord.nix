{ inputs, programs, pkgs, ... }:
{
  imports = [ 
    inputs.nixcord.homeModules.nixcord 
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;

    config = {
      plugins = {
        fakeNitro.enable = true;
      };
    };
  };
}
