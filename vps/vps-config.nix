{ pkgs, modulesPath, ... }:
{
  imports = [
    ./vps-hardware.nix
  ];

  system.stateVersion = "25.11";
  nix.settings.experimental-features = "flakes nix-command";

  # SSH
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5CsQlVSAIkJbk+8jj0sppxijKw02U7K21eVTNv36D7 simon.reilich137@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/9Vh3mp1SoF9xzbR8BrLaSZEjx26envKfvbLYU/OO9 simon.reilich137@gmail.com"
  ];

  # Setup
  systemd.services.setup = rec {
    wantedBy = [ "basic.target" ];
    after = wantedBy;
    serviceConfig = {
      Type = "oneshot";
      ConditionPathExists = "/etc/nixos/setup.sh";
      ExecStart = "/etc/nixos/setup.sh";
      ExecStartPost = "${pkgs.coreutils}/bin/rm /etc/nixos/setup.sh";
    };
  };
}
