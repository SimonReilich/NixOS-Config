{ pkgs, hardware, ... }:

{
  imports = [
    ./system
    ../common/config.nix

    # Include the results of the hardware scan.
    ./tablet-hardware.nix
  ];

  hardware.microsoft-surface.kernelVersion = "stable";
}
