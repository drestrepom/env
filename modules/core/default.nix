{
  config,
  lib,
  modulesPath,
  pkgs,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.kernelModules = ["kvm-intel"];
  boot.kernelPackages = let
    packages = pkgs.linuxPackages_latest;
  in
    builtins.trace "Linux: ${packages.kernel.version}" packages;

  documentation.nixos.enable = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.ssh.startAgent = true;

  system.stateVersion = "22.05";
}
