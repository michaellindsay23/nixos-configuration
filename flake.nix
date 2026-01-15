{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";

    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell.url = "github:caelestia-dots/shell";
    caelestia-cli.url = "github:caelestia-dots/cli";

    nixcord.url = "github:kaylorben/nixcord";

    nixvim-config.url = "github:michaellindsay23/nixvim-config";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
  };

  outputs = inputs @ { 
    self, 
    nixpkgs,
    hyprland,
    zen-browser,
    hyprdynamicmonitors,
    home-manager,
    caelestia-shell,
    caelestia-cli,
    nixcord,
    nixvim-config,
    aagl,
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
          inherit self inputs username system;
        };
      };

      laptop-gaming = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/laptop-gaming
          ./modules/home/gaming/steam.nix
        ];
        specialArgs = {
          host = "laptop-gaming";
          inherit self inputs username system;
        };
      };

      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/desktop
          ./modules/home/gaming
        ];
        specialArgs = {
          host = "desktop";
          inherit self inputs username system;
        };
      };
    };
  };
}
