{
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/EFI";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-partlabel/root";
      fsType = "ext4";
    };
    "/home" = {
      device = "/dev/disk/by-partlabel/data";
      fsType = "ext4";
    };
    "/boot/EFI" = {
      device = "/dev/disk/by-partlabel/ESP";
      fsType = "vfat";
    };
  };

  services.udisks2.enable = true;
  home-manager.users.drestrepo.services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
