{ config, pkgs, ... }:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";

  systemd.services.wait-for-dns = {
    wantedBy = [ "multi-user.target" ];
    description = "Wait for DNS to come up using 'host'";
    restartIfChanged = false;
    onSuccess = [ "pull-updates.service" ];
    path = [
      pkgs.host
    ];
    script = ''
      until host github.com; do sleep 60; done
    '';
    serviceConfig = {
      PassEnvironment = "DISPLAY";
      WorkingDirectory = "/home/simonr/.dotfiles";
      User = "simonr";
      Type = "oneshot";
    };
  };

  systemd.services.pull-updates = {
    description = "Pulls changes to system config";
    restartIfChanged = false;
    onSuccess = [ "rebuild.service" ];
    onFailure = [ "notify-change.service" ];
    path = [
      pkgs.git
      pkgs.openssh
    ];
    script = ''
      test "$(git branch --show-current)" = "main"
      if git diff HEAD..origin/main --name-only | grep flake.lock; then
        exit 1
      else
        git pull --ff-only
        exit 0
      fi
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
    path = [
      pkgs.nixos-rebuild
      pkgs.systemd
    ];
    script = ''
      nixos-rebuild switch --flake .
    '';
    serviceConfig = {
      PassEnvironment = "DISPLAY";
      WorkingDirectory = "/home/simonr/.dotfiles";
      User = "root";
      Type = "oneshot";
    };
  };

  systemd.services.notify-change = {
    description = "Notifies the user that flake.lock has changed";
    restartIfChanged = false;
    path = [
      pkgs.libnotify
    ];
    script = ''
      notify-send -A "Open in VSCode" -u critical "flake.lock file was changed, please update manually" -a NixOS
      code .
    '';
    serviceConfig = {
      PassEnvironment = "DISPLAY";
      WorkingDirectory = "/home/simonr/.dotfiles";
      User = "simonr";
      Type = "oneshot";
    };
  };
}
