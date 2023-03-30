{
  lib,
  pkgs,
  config,
  pythonOnNix,
  ...
}: {
  environment.shells = [pkgs.zsh];
  environment.binsh = "${pkgs.dash}/bin/dash";
  users = {
    defaultUserShell = pkgs.zsh;
    users.nixos.shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    interactiveShellInit = ''
            export NPM_CONFIG_PREFIX=${config.users.users.nixos.home}/.npm-global
            export PATH="$PATH:$NPM_CONFIG_PREFIX/bin"
            export DIRENV_WARN_TIMEOUT=1h
            source <(direnv hook zsh)

            ssh-add ${config.sops.secrets.ssh_key.path}
            export INTEGRATES_API_TOKEN="$(cat ${config.sops.secrets.INTEGRATES_API_TOKEN.path})"
            export CACHIX_AUTH_TOKEN="$(cat ${config.sops.secrets.CACHIX_AUTH_TOKEN.path})"

      function ol() {
        eval $(
          ${pythonOnNix.aws-okta-processor-latest-python39}/bin/bin/aws-okta-processor authenticate \
            --user "$(cat ${config.sops.secrets."okta/user".path})" \
            --pass "$(cat ${config.sops.secrets."okta/password".path})" \
            --organization "fluidattacks.okta.com" \
            --application "https://fluidattacks.okta.com/home/amazon_aws/0oa9ahz3rfx1SpStS357/272" \
            --silent \
            --duration 32400 \
            --environment \
            --no-aws-cache
        )
        export DEV_AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
        export DEV_AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
      }
    '';
  };

  home-manager.users.nixos.programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "branch"
        "colorize"
        "dirhistory"
        "docker"
        "emoji"
        "git"
        "history"
        "kubectl"
        "sudo"
        "web-search"
      ];
    };
    plugins = [
      {
        file = "powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
      {
        file = "p10k.zsh";
        name = "powerlevel10k-config";
        src = ./.;
      }
      {
        file = "nix-shell.plugin.zsh";
        name = "zsh-nix-shell";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
    ];
  };
}
