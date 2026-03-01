{ config, pkgs, ... }:

{
  systemd.timers."check-dns-availability" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnBootSec = "15m";
      OnUnitActiveSec = "15m";
      Unit = "check-dns-availability.service";
    };
  };

  systemd.services = {
    check-dns-availability = {
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

    pull-updates = {
      description = "Pulls changes to system config";
      restartIfChanged = false;
      path = [
        pkgs.git
        pkgs.openssh
        pkgs.systemd
      ];
      script = ''
        git fetch
        if test "$(git branch --show-current)" = "main"; then
          if git diff HEAD..origin/main --name-only | grep flake.lock; then
            ${pkgs.systemd}/bin/systemctl --machine=simonr@.host --user start notify-lock-change.service
            exit
          elif git status -sb | grep behind; then
            git pull --ff-only
            ${pkgs.systemd}/bin/systemctl --machine=simonr@.host start rebuild.service
            exit
          fi
        fi
        exit
      '';
      serviceConfig = {
        PassEnvironment = "DISPLAY";
        WorkingDirectory = "/home/simonr/.dotfiles";
        SuccessExitStatus = "1";
        User = "simonr";
        Type = "oneshot";
      };
    };

    rebuild = {
      description = "Rebuilds and activates system config";
      restartIfChanged = false;
      path = [
        pkgs.nixos-rebuild
        pkgs.systemd
      ];
      script = ''
        ${pkgs.systemd}/bin/systemctl --machine=simonr@.host --user start notify-update.service
        nixos-rebuild switch --flake .
        ${pkgs.systemd}/bin/systemctl --machine=simonr@.host --user start notify-done.service
      '';
      serviceConfig = {
        PassEnvironment = "DISPLAY";
        WorkingDirectory = "/home/simonr/.dotfiles";
        User = "root";
        Type = "oneshot";
      };
    };
  };

  systemd.user.services.notify-update = {
    description = "Notifies the user that the system is currently updating in the background";
    path = [
      pkgs.libnotify
      pkgs.systemd
      pkgs.bash
    ];
    script = ''
      ${pkgs.libnotify}/bin/notify-send \
        --urgency=normal \
        -a NixOS \
        "The remote has changed" \
        "Updating in the background ..."
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };

  systemd.user.services.notify-done = {
    description = "Notifies the user that the system is done updating";
    path = [
      pkgs.libnotify
      pkgs.systemd
      pkgs.bash
    ];
    script = ''
      ${pkgs.libnotify}/bin/notify-send \
        --urgency=normal \
        -a NixOS \
        "Update was succesfull" \
        "System is now fully available."
    '';
    serviceConfig = {
      Type = "oneshot";
    };
  };

  systemd.user.services.notify-lock-change = {
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
