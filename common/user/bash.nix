{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.adwaita-mono
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export JAVA_HOME=/nix/store/95giahyida5jyca72a70rfp5v5qjjcpd-openjdk-17.0.15+6/lib/openjdk
      eval "$(oh-my-posh init bash)"
    '';
  };
}
