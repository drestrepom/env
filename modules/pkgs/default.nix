{
  makesPkg,
  pkgs,
  ...
}: {
  imports = [
    ./editor
    ./git
    ./terminal
    ./timedoctor
  ];

  home-manager.users.nixos = {
    home.packages = [
      makesPkg
      pkgs._1password-gui-beta
      pkgs.awscli
      pkgs.binutils
      pkgs.comma
      pkgs.coreutils
      pkgs.htop
      pkgs.jq
      pkgs.just
      pkgs.kubectl
      pkgs.gnugrep
      pkgs.google-chrome
      pkgs.nodejs
      pkgs.pamixer
      pkgs.parted
      pkgs.python310
      pkgs.shadow
      pkgs.sops
      pkgs.terraform
      pkgs.vlc
      pkgs.yq
      pkgs.wget
    ];

    programs = {
      neovim = {
        enable = true;
        vimAlias = true;
      };
    };
  };
}
