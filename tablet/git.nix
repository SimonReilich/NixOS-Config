{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "SimonReilich";
      user.email = "simon.reilich@proton.me";
      init.defaultBranch = "main";
      credential = {
        helper = "manager";
        "https://github.com".username = "SimonReilich";
        credentialStore = "cache";
      };
    };
  };
}
