{ config, pkgs, ... }:

{
  systemd.timers.weekly-git-pull-rebuild = {
    description = "Weekly Git Pull and NixOS Rebuild";
    wantedBy = [ "timers.target" ];
    partOf = [ "weekly-git-pull-rebuild.service" ];
    timerConfig = {
      OnCalendar = "Sun *-*-* 06:00:00";
      Persistent = true;
    };
  };

  systemd.services.weekly-git-pull-rebuild = {
    description = "Pull Git Repository and Rebuild NixOS";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.bash}/bin/bash -c '
          cd /root/nix-config && \
          ${pkgs.git}/bin/git pull && \
          ${pkgs.nixos-rebuild}/bin/nixos-rebuild switch --flake /root/nix-config#server
        '
      '';
      User = "root";
      WorkingDirectory = "/root/nix-config";
    };
  };
}