{lib, ...}: {
  networking = {
    hostName = "nixos";
    nameservers = ["1.1.1.1" "8.8.8.8" "8.8.4.4"];
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [25565 443 80 22];
    };
  };

  users.users.nixos.extraGroups = ["networkmanager"];
}
