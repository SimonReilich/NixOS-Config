{ pkgs, modulesPath, ... }:
{
  imports = [
    ./system
    ../common/config.nix

    ./server-hardware.nix
  ];
  
  sops.age.keyFile = "/root/.config/sops/age/keys.txt";

  # SSH
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5CsQlVSAIkJbk+8jj0sppxijKw02U7K21eVTNv36D7 simon.reilich137@gmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/9Vh3mp1SoF9xzbR8BrLaSZEjx26envKfvbLYU/OO9 simon.reilich137@gmail.com"
  ];
}
