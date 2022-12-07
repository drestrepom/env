{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/ESP";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-partlabel/data";
    fsType = "vfat";
  };
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/root";
    fsType = "vfat";
  };
  swapDevices = [
    {
      device = "/dev/disk/by-partlabel/swap";
    }
  ];

  services.udisks2.enable = true;
  home-manager.users.nixos.services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
