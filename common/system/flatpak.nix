{
  inputs,
  pkgs,
  ...
}:

{
  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    packages = [
      {
        bundle = "/home/simonr/.dotfiles/.flatpaks/hytale-launcher-latest.flatpak";
        appId = "<appId>";
        sha256 = "<hash>";
      }
    ];
  };
}
