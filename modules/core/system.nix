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
    vim
    wget
    git
    curl
  ];

  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
}
