{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    sensibleOnTop = true;
    prefix = "C-Space";
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      catppuccin
      vim-tmux-navigator
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on

      bind -n M-H previous-window
      bind -n M-L next-window

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber windows on
    '';
  };
}
