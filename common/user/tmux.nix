{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    sensibleOnTop = true;
    prefix = "C-Space";
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      vim-tmux-navigator
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"

      bind -n M-H previous-window
      bind -n M-L next-window

      set -g @plugin 'dreamsofcode-io/catppuccin-tmux'
    '';
  };
}
