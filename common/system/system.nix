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
    onFailure = [ "trigger-user-notify.service" ];
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

  systemd.services.trigger-user-notify = {
    script = "${pkgs.systemd}/bin/systemctl --machine=simonr@.host --user start notify-change.service";
    serviceConfig.Type = "oneshot";
  };

  systemd.user.services.notify-change = {
    description = "Notifies the user that flake.lock has changed";
    path = [
      pkgs.libnotify
      pkgs.systemd
      pkgs.bash
    ];
    script = ''
      ${pkgs.libnotify}/bin/notify-send \
        --urgency=critical \
        -a NixOS \
        "flake.lock file was changed" \
        "Manual update required."
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };
}
