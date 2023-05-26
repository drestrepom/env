{
  config,
  lib,
  pkgs,
  sops,
  ...
}: {
  sops.age.keyFile = "/home/nixos/.config/sops/age/keys.txt";
  sops.defaultSopsFile = ./secrets.yaml;
  sops.secrets.ssh_key = {
    owner = config.users.users.nixos.name;
  };
  sops.secrets."okta/password" = {
    owner = config.users.users.nixos.name;
  };
  sops.secrets."okta/user" = {
    owner = config.users.users.nixos.name;
  };
  sops.secrets.INTEGRATES_API_TOKEN = {
    owner = config.users.users.nixos.name;
  };
  sops.secrets.CACHIX_AUTH_TOKEN = {
    owner = config.users.users.nixos.name;
  };
  sops.secrets.UNIVERSE_API_TOKEN = {
    owner = config.users.users.nixos.name;
  };
}
