{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = inputs@{ self, nixpkgs, disko, zen-browser, home-manager, ... }:
  let
    system_type = "x86_64-linux";
  in {
    homeConfigurations.michael-lindsay = home-manager.lib.homeManagerConfiguration {
      system = system_type;
      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix

        inputs.disko.nixosModules.disko
        
        #./hyperland.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.users.michael-lindsay.imports = [
            ./home.nix
          ];
          home-manager.extraSpecialArgs = { 
            inherit inputs;
            system = system_type;
          };
        }

        # enable experimental features permanently
        {
          nix = {
            settings.experimental-features = [ "nix-command" "flakes" ];
          };
        }
      ];
    };
  };
}
