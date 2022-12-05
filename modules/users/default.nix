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
    drestrepo = {
      isNormalUser = true;
      hashedPassword = "$6$K.LcVGhhOm6tIwK6$73yska.1TGbYr52WU7JdW8z/LDFPj5RF7HWdBjsRe2xfbVML5nTjA4j/9Dtw98LnmNwYzcKaLZ0qxe/hy7JrY.";
      description = "Diego Restrepo";
      home = "/home/drestrepo";
      group = "users";
      extraGroups = ["wheel"];
    };
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users = {
      drestrepo = {
        programs.home-manager.enable = true;
        targets.genericLinux.enable = true;
        systemd.user.startServices = true;
        home = {
          username = "drestrepo";
          homeDirectory = "/home/drestrepo";
          stateVersion = config.system.stateVersion;
        };
      };
    };
  };
}
