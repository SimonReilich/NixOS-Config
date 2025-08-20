{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  programs.bash.shellInit = "eval \"$(oh-my-posh init bash --config /home/simonr/.dotfiles/common/omp.toml\"";
}