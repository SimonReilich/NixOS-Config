{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.adwaita-mono
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      if [ -z "$TMUX" ] && [ '$'{UID} != 0 ]
      then
          tmux new-session -A -s main
      fi
    '';
  };
}
