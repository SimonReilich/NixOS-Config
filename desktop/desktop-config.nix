{
  imports = [
    ./system
    ../common/config.nix
    ./desktop-style.nix

    # Include the results of the hardware scan.
    ./desktop-hardware.nix
  ];
}
