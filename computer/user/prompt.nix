{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.adwaita-mono
  ];

  programs.oh-my-posh = {
    enable = true;
    settings = {

    };
    configFile = /home/simonr/Documents/Infra/nix-config/computer/user/prompt.toml;
    enableZshIntegration = true;
  };
}
