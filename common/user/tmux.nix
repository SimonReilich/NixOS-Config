{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    sensibleOnTop = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      vim-tmux-navigator
    ];
    extraConfig = ''

    '';
  };
}
