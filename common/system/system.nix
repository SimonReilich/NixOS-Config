{ config, pkgs, ... }:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";

  systemd.services.pull-updates = {
    wantedBy = [ "multi-user.target" ];
    description = "Pulls changes to system config";
    restartIfChanged = false;
    onSuccess = [ "rebuild.service" ];
    path = [pkgs.git pkgs.openssh];
    script = ''
      test "$(git branch --show-current)" = "main"
      git pull --ff-only
    '';
    serviceConfig = {
      PassEnvironment = "DISPLAY";
      WorkingDirectory = "/home/simonr/.dotfiles";
      User = "simonr";
      Type = "oneshot";
    };
  };

  systemd.services.rebuild = {
    description = "Rebuilds and activates system config";
    restartIfChanged = false;
    path = [pkgs.nixos-rebuild pkgs.systemd];
    script = ''
      nixos-rebuild switch
    '';
    serviceConfig.Type = "oneshot";
  };
}
