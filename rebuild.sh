git add .
nix flake update nivxim-config
sudo nixos-rebuild switch --flake .#laptop
