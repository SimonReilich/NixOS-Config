{ config, pkgs, ... }:

{
  services.pulseaudio.enable = false;
  services.dbus.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    alsa-utils
    libpulseaudio
    libglvnd
    pipewire
  ];
}
