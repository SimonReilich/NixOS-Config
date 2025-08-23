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
      if [ -z "$TMUX" ] && [ '$'{UID} != 0 ]
      then
          tmux new-session -A -d -s main;
          tmux send 'fastfetch' ENTER;
          tmux a;
      fi
    '';
  };
}
