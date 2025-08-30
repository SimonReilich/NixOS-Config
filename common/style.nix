{ pkgs, ... }:
{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ./wallpaper.jpg;
  stylix.polarity = "dark";

  stylix.fonts = {
    serif = {
      package = pkgs.lexend;
      name = "Lexend";
    };

    sansSerif = {
      package = pkgs.lexend;
      name = "Lexend";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
}
