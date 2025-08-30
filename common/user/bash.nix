{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.adwaita-mono
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(oh-my-posh init bash)"
    '';
  };
}
