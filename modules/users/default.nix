{
  config,
  pkgs,
  ...
}: {
  security.sudo = {
    enable = true;
    extraRules = [
      {
        groups = ["wheel"];
        commands = [
          {
            command = "ALL";
            options = ["SETENV" "NOPASSWD"];
          }
        ];
      }
    ];
  };

  users.users = {
    root = {
      hashedPassword = "$5$/tA2O3iAxESoLgX7$bc.UHwSSkUJbXvESztKqMlkk.dhrFSSVleHhcFLkcJ9";
    };
    nixos = {
      isNormalUser = true;
      hashedPassword = "$5$/tA2O3iAxESoLgX7$bc.UHwSSkUJbXvESztKqMlkk.dhrFSSVleHhcFLkcJ9";
      description = "Daniel Salazar";
      home = "/home/nixos";
      group = "users";
      extraGroups = ["wheel"];
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users = {
      nixos = {
        programs.home-manager.enable = true;
        targets.genericLinux.enable = true;
        systemd.user.startServices = true;
        home = {
          username = "nixos";
          homeDirectory = "/home/nixos";
          stateVersion = config.system.stateVersion;
        };
      };
    };
  };
}
