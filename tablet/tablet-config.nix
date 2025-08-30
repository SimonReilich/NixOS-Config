{
  imports = [
    ./system
    ../common/config.nix
    ./tablet-style.nix

    # Include the results of the hardware scan.
    ./tablet-hardware.nix
  ];
}
