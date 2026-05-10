{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.git-credential-manager
  ];

  programs.git = {
    enable = true;
    userName = "SimonReilich";
    userEmail = "simon.reilich@proton.me";

    extraConfig = {
      init.defaultBranch = "main";
      credential = {
        helper = "manager";
        "https://github.com".username = "SimonReilich";
        "https://codeberg.org".username = "SimonReilich";
        credentialStore = "cache";
      };
    };

    includes = [
      {
        condition = "hasconfig:remote.*.url:*codeberg.org*";
        contents = {
          gpg.format = "ssh";
          user.signingkey = "~/.ssh/codeberg.pub";
          commit.gpgsign = true;
        };
      }
    ];
  };
}
