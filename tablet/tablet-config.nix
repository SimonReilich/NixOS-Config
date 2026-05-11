{ pkgs, hardware, ... }:

{
  imports = [
    ./system
    ../common/config.nix
    ../computer/config.nix
    ./tablet-style.nix

    # Include the results of the hardware scan.
    ./tablet-hardware.nix
  ];

  hardware.microsoft-surface.kernelVersion = "stable";
}
