{
  imports = [
    ./system
    ../common/config.nix

    # Include the results of the hardware scan.
    ./desktop-hardware.nix
  ];
}
