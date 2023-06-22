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
        userEmail = "drestrepo@fluidattacks.com";
        extraConfig = {
          core.editor = "${editor}/bin/code --wait";
          diff.tool = "${editor}/bin/code";
          difftool.editor.cmd = "${editor}/bin/code --diff $LOCAL $REMOTE --wait";
          merge.tool = "${editor}/bin/code";
          mergetool.editor.cmd = "${editor}/bin/code --wait $MERGED";
          safe.directory = [
            "/home/nixos/universe"
          ];
          gpg.format = "ssh";
        };
        signing = {
          signByDefault = true;
          key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxPxx2z6HoWcppe0akAvbE60bodsGc1UqO2WCe75tJyqKS98r/jzC4DollCnwkaqKZ0iPu3bK9lR2NW+GDHKWNSllYPRPTOvGjp+pTvnrC8sTT1t3TMY1SOQy1zf+5DHvlg/OPu8hPV6Lqp791sixBw/C5W01yXcZ/ChLpdkQzXiXbpS09d5XdVfLldN7aA2FNYnh0vYZ2UdxwKCTbNVoix175HdUsOrJ8mtBhAbcDwZ484GRdv91ScXlXn0z7Pbo3qn1QmCRUjSq7VW2caAi5pu19kzY0SSu0zi5bstAJcmS2sWvb9dPyDGOSF+AFEMyY3BPxycZ21H2+WeMZ89VBFD1vosxDM82faw2eST0CCi301Ve1oVJdZBe7b8o166zQ5rC+ql9GZDUN42OZZ6g4jufRtSRPhTHvV9SIIwxfZ46jTWorjpQSEEskz/E/oPQRxqXWWtmy01cShRVlp6Re1XANXqn1UMxZfJUfh3+xPMQDuf6yWLsx84eevUfewI+fSB8rtpOhAZZZkFsscDME46y2rJDwGo+UMnX79L2OxbC8GTCiIH3GCY7Y4Uzapv19bH9qX4hZYJ1ojlvtpnvURZd2rh34+4n6dBcDbvmqsmNvC5lrmKp+gBJ2+xdnUdFwoHXYxDmfFJfU1Z+UHADmthieK80MNplNGqFeZD7k1Q==";
        };
      };
    };
  };
}
