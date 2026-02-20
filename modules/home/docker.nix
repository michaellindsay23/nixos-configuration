{ ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    data-root = "~/Projects/docker/";
  };
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
