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
}
