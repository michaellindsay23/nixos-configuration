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

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { 
    self, 
    nixpkgs,
    home-manager, 
    caelestia-shell,
    caelestia-cli,
    nixcord,
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
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
          ./hosts/laptop
        ];
        specialArgs = {
          host = "laptop";
          inherit self inputs username;
        };
      };
    };
  };
}
