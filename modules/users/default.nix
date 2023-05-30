{
  config,
  pkgs,
  sops,
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
  users.mutableUsers = false;
  users.users = {
    root = {
      password = "052030";
    };
    nixos = {
      isNormalUser = true;
      description = "Diego Restrepo";
      home = "/home/nixos";
      group = "users";
      extraGroups = ["wheel"];
      password = "052030";
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
