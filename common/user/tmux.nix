{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.bash}/bin/bash";
    sensibleOnTop = true;
    prefix = "C-Space";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      catppuccin
      vim-tmux-navigator
      yank
    ];
    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g mouse on

      bind -n M-H previous-window
      bind -n M-L next-window

      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancle

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
    '';
  };
}
