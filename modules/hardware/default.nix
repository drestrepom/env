{
  pkgs,
  config,
  ...
}: {
  imports = [./auto-detected.nix];
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # services.xserver.videoDrivers = ["nvidia"];
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.enableAllFirmware = true;
}
