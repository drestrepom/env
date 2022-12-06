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
      hashedPassword = "$6$K.LcVGhhOm6tIwK6$73yska.1TGbYr52WU7JdW8z/LDFPj5RF7HWdBjsRe2xfbVML5nTjA4j/9Dtw98LnmNwYzcKaLZ0qxe/hy7JrY.";
    };
    nixos = {
      isNormalUser = true;
      hashedPassword = "$6$K.LcVGhhOm6tIwK6$73yska.1TGbYr52WU7JdW8z/LDFPj5RF7HWdBjsRe2xfbVML5nTjA4j/9Dtw98LnmNwYzcKaLZ0qxe/hy7JrY.";
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
