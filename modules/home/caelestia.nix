{ inputs, programs, pkgs, ...}:
{
  home.packages = ( with pkgs; [ 
    inputs.caelestia-shell.packages."${system}".with-cli 
    inputs.caelestia-cli.packages."${system}".with-shell
  ] );
}
