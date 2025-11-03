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
    path = [
      pkgs.git
      pkgs.openssh
    ];
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
    path = [
      pkgs.nixos-rebuild
      pkgs.systemd
    ];
    script = ''
      NIX_PATH=/home/simonr/.nix-defexpr/channels:nixpkgs=flake:nixpkgs:/nix/var/nix/profiles/per-user/root/channels
      nixos-rebuild switch
    '';
    serviceConfig.Type = "oneshot";
  };
}
