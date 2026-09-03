{pkgs, nix-index-database, ...} :
{
  home.pkgs = with pkgs; [
    nix-index-database.homeModules.default
  ];

  programs.nix-index-database = {
    enable = true;
    comma.enable = true;
  };
}
