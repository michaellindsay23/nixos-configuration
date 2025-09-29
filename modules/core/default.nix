{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./system.nix
    ./boot.nix
    ./home-manager.nix
    ./wayland.nix
    #./greetd.nix
  ];
}
