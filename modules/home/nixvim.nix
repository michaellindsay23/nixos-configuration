{ inputs, pkgs, ... }:
{
  home.packages = [ inputs.nixvim-config.packages.${pkgs.system}.default ];
}
