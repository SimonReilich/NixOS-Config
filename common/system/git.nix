{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    git-credential-manager
  ];

  programs.git = {
    enable = true;
    config = {
      user.name = "SimonReilich";
      user.email = "accounts@sreilich.de";
      init.defaultBranch = "main";
      credential = {
        helper = "manager";
        "https://github.com".username = "SimonReilich";
        credentialStore = "cache";
      };
    };
  };
}
