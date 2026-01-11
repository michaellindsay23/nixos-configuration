{ inputs, pkgs, ... }:
#let
#  tidalPkgs = import inputs.nixpkgs {
#    system = pkgs.system;
#    overlays = [ inputs.tidalcycles.overlays.default ];
#  };
#in
{
  home.packages = with pkgs; [
    supercollider-with-plugins
    tmux
    cabal-install
    cabal2nix
    ghc
  ];
}

