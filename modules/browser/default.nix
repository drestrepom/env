{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "browser" ''
      exec ${pkgs.brave}/bin/brave \
        --user-data-dir=/data/browser/data \
        "$@"
    '')
    (pkgs.writeShellScriptBin "x-www-browser" ''
      browser "$@"
    '')
  ];
  programs.chromium.enable = true;
  # https://chromeenterprise.google/policies/
  programs.chromium.extraOpts = {
    BookmarkBarEnabled = true;
    DefaultBrowserSettingEnabled = false;
    DefaultSearchProviderEnabled = true;
    DefaultSearchProviderSearchURL = "https://www.google.com/search?q={searchTerms}";
    ExtensionInstallForcelist = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
      "mobhfbcgjoleoljhpkkdhopdiemlocka" # RPass
      "aapbdbdomjkkjkaonfhkkikfgjllcleb" # Google Translator
      "oldceeleldhonbafppcapldpdifcinji" # Language Tools
      "neebplgakaahbhdphmkckjjcegoiijjo" # Keepa
      "omdakjcmkglenbhjadbccaookpfjihpa" # vpn
      "glnpjglilkicbckjpbgcfkogebgllemb" # okta
    ];
    HighContrastEnabled = true;
    ImportBookmarks = false;
    ManagedBookmarks = [
      {toplevel_name = "Links";}
      {
        name = "Comunications";
        children = [
          {
            name = "discord";
            url = "https://discord.com";
          }
        ];
      }
      {
        name = "Fluid Attacks";
        children = [
          {
            name = "backlog-universe";
            url = "https://gitlab.com/dashboard/issues?assignee_username=kamadoatfluid&sort=label_priority";
          }
          {
            name = "backlog-makes";
            url = "https://github.com/orgs/fluidattacks/projects/2/views/2";
          }
        ];
      }
      {
        name = "Learning";
        children = [
          {
            name = "laurie blog";
            url = "https://tratt.net/laurie/blog/archive.html";
          }
          {
            name = "laurie essays";
            url = "https://tratt.net/laurie/essays/archive.html";
          }
          {
            name = "papers 1";
            url = "https://github.com/facundoolano/software-papers";
          }
          {
            name = "kernel";
            url = "https://linux-kernel-labs.github.io/refs/heads/master/index.html";
          }
          {
            name = "rust-embedded";
            url = "https://docs.rust-embedded.org/book/";
          }
          {
            name = "rust-nomicon";
            url = "https://doc.rust-lang.org/nomicon";
          }
          {
            name = "scure-programs-how-to";
            url = "https://dwheeler.com/secure-programs/Secure-Programs-HOWTO.html";
          }
          {
            name = "OpenSSF courses";
            url = "https://openssf.org/training/courses/";
          }
          {
            name = "CISA knowledge";
            url = "https://www.cisa.gov/uscert/bsi/articles/knowledge/principles";
          }
          {
            name = "ISO/IEC/IEEE 12207";
            url = "http://bls.buu.ac.th/~se888321/2560/00Jan08/8100771-ISO12207-2017.pdf";
          }
        ];
      }
      {
        name = "Nix";
        children = [
          {
            name = "home-manager-manual";
            url = "https://nix-community.github.io/home-manager";
          }
          {
            name = "home-manager-options";
            url = "https://nix-community.github.io/home-manager/options.html";
          }
          {
            name = "nix-ux-roadmap";
            url = "https://github.com/orgs/NixOS/projects/10/views/1";
          }
          {
            name = "nixos-forum";
            url = "https://discourse.nixos.org/latest";
          }
          {
            name = "nixos-options";
            url = "https://search.nixos.org/options";
          }
          {
            name = "nixos-packages";
            url = "https://search.nixos.org/packages";
          }
          {
            name = "pkgs-manual";
            url = "https://nixos.org/manual/pkgs/unstable";
          }
          {
            name = "pkgs-prs";
            url = "https://github.com/NixOS/pkgs/pulls?q=is%3Aopen+is%3Apr+kamadorueda";
          }
          {
            name = "pkgs-prs-bot";
            url = "https://github.com/NixOS/pkgs/pulls?q=is%3Aopen+is%3Apr+author%3Ar-ryantm";
          }
        ];
      }
      {
        name = "Rust";
        children = [
          {
            name = "forum";
            url = "https://users.rust-lang.org";
          }
        ];
      }
    ];
    PasswordManagerEnabled = false;
    ShowAppsShortcutInBookmarkBar = false;
  };
}
