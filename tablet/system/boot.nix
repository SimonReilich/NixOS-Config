{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot.kernelPatches = [
    {
      name = "rust-1.91-fix";
      patch = ./patches/rust-fix.patch;
    }
  ];

  # secureboot with lanzaboote

  environment.systemPackages = with pkgs; [
    sbctl
  ];

  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
