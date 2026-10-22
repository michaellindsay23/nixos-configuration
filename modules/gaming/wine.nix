{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # native wayland support (unstable)
    wineWow64Packages.waylandFull
  ];
}
