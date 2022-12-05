{
  pkgs,
  editor,
  ...
}: {
  home-manager.users.drestrepo = {
    programs = {
      git = {
        enable = true;
        package = pkgs.gitAndTools.gitFull;
        userName = "Diego Restrepo";
        userEmail = "restrepomesadiego@gmail.com";
        extraConfig = {
          core.editor = "${editor}/bin/code --wait";
          diff.tool = "${editor}/bin/code";
          difftool.editor.cmd = "${editor}/bin/code --diff $LOCAL $REMOTE --wait";
          merge.tool = "${editor}/bin/code";
          mergetool.editor.cmd = "${editor}/bin/code --wait $MERGED";
        };
        signing = {
          signByDefault = true;
          key = "0x1DB5E8128304E704";
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
