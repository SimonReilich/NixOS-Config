{
  config,
  inputs,
  pkgs,
  ...
}:
let

in
{
  accounts.email.accounts = {
    t-online = {
      realName = "Simon Reilich";
      enable = true;
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };

      primary = true;
      address = "simonreilich@t-online.de";
      userName = "simonreilich@t-online.de";

      imap = {
        host = "secureimap.t-online.de";
        port = 993;
        tls.enable = true;
      };
      signature.text = ''
        Simon Reilich
      '';
    };
    gmail = {
      realName = "Simon Reilich";
      enable = true;
      flavor = "gmail.com";
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };

      address = "simon.reilich137@gmail.com";
      userName = "simon.reilich137";

      signature.text = ''
        Simon Reilich
      '';
    };
    tum-mail = {
      realName = "Simon Reilich";
      enable = true;
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };

      address = "simon.reilich@tum.de";
      userName = "ge92ham";

      imap = {
        host = "mail.tum.de";
        port = 993;
        tls.enable = true;
      };
      signature.text = ''
        Simon Reilich
      '';
    };
    judo = {
      realName = "Simon Reilich";
      enable = true;
      thunderbird = {
        enable = true;
        profiles = [ "default" ];
      };

      address = "simon.reilich@judoclub-ffb.de";
      userName = "simon.reilich@judoclub-ffb.de";

      imap = {
        host = "imap.ionos.de";
        port = 993;
        tls.enable = true;
      };
      smtp = {
        host = "smtp.ionos.de";
        port = 465;
        tls.useStartTls = true;
      };
      signature.text = ''
        Simon Reilich
      '';
    };
  };

  programs.thunderbird = {
    enable = true;
    profiles."default" = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "svg.context-properties.content.enabled" = true;
      };
    };
  };

  home.file = {
    ".thunderbird/default/chrome/thunderbird-gnome-theme".source = inputs.thunderbird-gnome-theme;

    ".thunderbird/default/chrome/userChrome.css".text = ''
      @import "thunderbird-gnome-theme/userChrome.css";
    '';

    ".thunderbird/default/chrome/userContent.css".text = ''
      @import "thunderbird-gnome-theme/userContent.css";
    '';
  };
}
