{ inputs, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    extraCompatPackages = [ 
      pkgs.proton-ge-bin 
      inputs.dw-proton-nix.packages.${pkgs.stdenv.hostPlatform.system}.dw-proton
    ];
  };
}
