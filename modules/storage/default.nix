{
  boot = {
    loader = {
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
    supportedFilesystems = ["ntfs"];
  };

  services.udisks2.enable = true;

  home-manager.users.nixos.services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "auto";
  };
}
