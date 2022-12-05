{lib, ...}: {
  networking = {
    hostName = "drestrepo";
    nameservers = ["1.1.1.1" "8.8.8.8" "8.8.4.4"];
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  users.users.drestrepo.extraGroups = ["networkmanager"];
}
