{ inputs, programs, pkgs, ...}:
{
  home.packages = ( with pkgs; [ 
    inputs.caelestia-shell.packages."${system}"."with-cli" 
  ] );
}
