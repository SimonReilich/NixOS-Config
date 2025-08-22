{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.adwaita-mono
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
        tmux new-session -A -s main
    '';
  };
}
