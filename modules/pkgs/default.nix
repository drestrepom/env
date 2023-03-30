{
  makesPkg,
  pkgs,
  fenix,
  devenv,
  ...
}: {
  imports = [
    ./editor
    ./git
    ./shell
    ./terminal
    ./timedoctor
  ];

  home-manager.users.nixos = {
    home.packages = [
      makesPkg
      pkgs._1password-gui-beta
      pkgs._1password
      pkgs.awscli
      pkgs.binutils
      pkgs.brave
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

      (pkgs.fenix.complete.withComponents [
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
}
