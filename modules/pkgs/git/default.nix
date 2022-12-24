{
  pkgs,
  editor,
  ...
}: {
  home-manager.users.nixos = {
    programs = {
      git = {
        enable = true;
        package = pkgs.gitAndTools.gitFull;
        userName = "Diego Restrepo";
        userEmail = "drestrepo@fluidttacks.com";
        extraConfig = {
          core.editor = "${editor}/bin/code --wait";
          diff.tool = "${editor}/bin/code";
          difftool.editor.cmd = "${editor}/bin/code --diff $LOCAL $REMOTE --wait";
          merge.tool = "${editor}/bin/code";
          mergetool.editor.cmd = "${editor}/bin/code --wait $MERGED";
          safe.directory = [
            "/home/nixos/universe"
          ];
        };
        signing = {
          signByDefault = true;
          key = "0x7847400F52AF3CC1";
        };
      };
      gpg.enable = true;
    };
    services.gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
    };
  };
}
