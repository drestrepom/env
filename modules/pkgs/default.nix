{
  makesPkg,
  pkgs,
  fenix,
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
      pkgs.python311
      pkgs.qbittorrent
      pkgs.rust-analyzer-nightly
      pkgs.shadow
      pkgs.sops
      pkgs.terraform
      pkgs.unzip
      pkgs.vlc
      pkgs.yq
      pkgs.wget

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
