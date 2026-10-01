{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    xdg-utils
  ];
}
