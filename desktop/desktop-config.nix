{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./system
    ../common/config.nix
    ./desktop-style.nix

    # Include the results of the hardware scan.
    ./desktop-hardware.nix
  ];

  hardware.graphics.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
}
