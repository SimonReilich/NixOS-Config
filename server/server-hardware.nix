{ pkgs, modulesPath, ... }:
{

  # Hardware
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };
  boot.loader.grub.device = "/dev/sda";
  boot.loader.timeout = 30;
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "xen_blkfront"
  ];
  boot.initrd.kernelModules = [ "nvme" ];
  boot.tmp.cleanOnBoot = true;

  zramSwap.enable = true;

  # Networking
  networking = {
    useNetworkd = true;
    usePredictableInterfaceNames = true;
    hostName = "srv1447093";
    domain = "hstgr.cloud";
  };
  systemd.network = {
    enable = true;
    networks."40-wan" = {
      matchConfig.Name = "enx3ce8d4bb24b5";
      address = [
        "2a02:4780:79:39c5::1/48"
        "187.124.17.143/24"
      ];
      routes = [
        {
          Gateway = "187.124.17.254";
          GatewayOnLink = true;
        }
        { Gateway = "2a02:4780:79::1"; }
      ];
      dns = [
        "2020:fe::10"
        "9.9.9.10"
      ];
    };
  };
}
