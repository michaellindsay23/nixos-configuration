{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell.url = "github:caelestia-dots/shell";
    caelestia-cli.url = "github:caelestia-dots/cli";

    nixcord.url = "github:kaylorben/nixcord";

    nixCats-nvim.url = "github:michaellindsay23/nixCats-config";
  };

  outputs = inputs @ { 
    self, 
    nixpkgs,
    home-manager, 
    caelestia-cli,
    caelestia-shell,
    nixcord,
    nixCats-nvim,
    ... 
  }:
  let
    username = "michael-lindsay";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixpkgs.overlays = inputs.nixCats-config.overlays.default;
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
          ./hosts/laptop
	  ./modules/home/steam.nix
        ];
        specialArgs = {
          host = "laptop";
          inherit self inputs username;
        };
      };
    };
  };
}
