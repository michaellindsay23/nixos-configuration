{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pulsar
  ];
}
