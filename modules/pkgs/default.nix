{
  makesPkg,
  pkgs,
  fenix,
  devenv,
  system,
  ...
}: {
  imports = [
    ./editor
    ./git
    ./shell
    ./terminal
    # ./timedoctor
  ];

  home-manager.users.nixos = {
    home.packages = [
      makesPkg
      pkgs.inetutils
      pkgs._1password-gui-beta
      pkgs._1password
      pkgs.awscli2
      pkgs.binutils
      pkgs.cachix
      pkgs.coreutils
      pkgs.direnv
      pkgs.google-chrome
      pkgs.gcc
      pkgs.htop
      pkgs.jq
      pkgs.just
      pkgs.kubectl
      pkgs.gnugrep
      pkgs.nodejs
      pkgs.nmap
      pkgs.sqlmap
      pkgs.zi
      pkgs.pamixer
      pkgs.parted
      pkgs.poetry
      pkgs.python311
      pkgs.qbittorrent
      pkgs.rust-analyzer-nightly
      pkgs.shadow
      pkgs.sops
      pkgs.spotify
      pkgs.terraform
      pkgs.translate-shell
      pkgs.unzip
      pkgs.vlc
      pkgs.yq
      pkgs.wget
      devenv.devenv
      (pkgs.fenix.latest.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
    ];

    programs = {
      neovim = {
        enable = true;
        vimAlias = true;
      };
    };
  };
  programs.ssh.startAgent = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
