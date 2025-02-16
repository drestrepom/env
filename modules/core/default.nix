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

  boot.kernelPackages = let
    packages = pkgs.linuxPackages_latest;
  in
    builtins.trace "Linux: ${packages.kernel.version}" packages;

  documentation.nixos.enable = true;
  services.printing.enable = true;
  sound.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "22.05";
}
