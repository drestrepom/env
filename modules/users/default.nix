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
  users.mutableUsers = true;
  users.users = {
    root = {
    };
    nixos = {
      isNormalUser = true;
      description = "Diego Restrepo";
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
