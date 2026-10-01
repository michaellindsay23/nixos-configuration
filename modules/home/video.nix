{ pkgs, ... }:
{
  home.packages = with pkgs; [
    simplescreenrecorder
    openshot-qt
  ];
}
