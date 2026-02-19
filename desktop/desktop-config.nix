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

    # Include the results of the hardware scan.
    ./desktop-hardware.nix
  ];

  hardware.graphics.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
}
