{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.adwaita-mono
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "AdwaitaMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "AdwaitaMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "AdwaitaMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "AdwaitaMono Nerd Font";
          style = "Bold Italic";
        };
        size = 16;
      };
    };
  };

}
