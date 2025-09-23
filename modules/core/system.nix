{ pkgs, inputs, ... }:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
}
