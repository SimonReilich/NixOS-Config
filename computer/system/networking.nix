{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    # TCP and UDP Ports for GSConnect
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };
}
