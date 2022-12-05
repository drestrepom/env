{
  pkgs,
  timedoctor,
  ...
}: {
  home-manager.users.drestrepo.home.packages = [
    (pkgs.writeShellScriptBin "timedoctor" ''
      ${timedoctor}/bin/timedoctor "$@" &> /dev/null &!
      exit 0
    '')
  ];
}
