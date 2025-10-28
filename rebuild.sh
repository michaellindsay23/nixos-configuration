git add .
nix flake update nixvim-config
sudo nixos-rebuild switch --flake .#$1
