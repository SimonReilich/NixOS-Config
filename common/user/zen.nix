{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    languagePacks = [
      "en-GB"
      "de"
    ];
    profiles."simon" = {
      name = "simon";
      settings = {
        "browser.search.region" = "DE";
        "browser.search.isUS" = false;
        "browser.uidensity" = 2;
        "distribution.searchplugins.defaultLocale" = "de";
        "general.useragent.locale" = "de";
      };
      isDefault = true;
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        proton-pass
        zotero-connector
      ];
      search = {
        force = true;
        default = "google";
        order = [
          "google"
          "nix-packages"
          "nixos-wiki"
        ];
        engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };

          translator-de-en = {
            name = "Google Translate DE -> EN";
            urls = [
              { template = "https://translate.google.com/?hl=de&sl=de&tl=en&text={searchTerms}&op=translate"; }
            ];
            definedAliases = [ "@de-en" ];
          };

          translator-en-de = {
            name = "Google Translate EN -> DE";
            urls = [
              { template = "https://translate.google.com/?hl=de&sl=en&tl=de&text={searchTerms}&op=translate"; }
            ];
            definedAliases = [ "@en-de" ];
          };

          google.metaData.alias = "@g";
        };
      };
      spacesForce = true;
      spaces = {
        "Daily" = {
          id = "fae7de7d-02f8-4a6a-b988-8c020febbd6d";
          icon = "🏠";
          position = 1000;
        };
        "School" = {
          id = "d8dfa020-6e06-4072-92e2-a2d5298458b7";
          icon = "📚";
          position = 2000;
        };
        "Uni" = {
          id = "45f366af-65c6-4645-bbf1-32f79ed35870";
          icon = "🎓";
          position = 3000;
        };
        "Social" = {
          id = "c35c5646-1cdb-439b-9c95-c3e603bb1afc";
          icon = "🫂";
          position = 4000;
        };
        "Dev" = {
          id = "b6cceec2-94b8-4b83-890d-279dba265438";
          icon = "👾";
          position = 5000;
        };
        "Content" = {
          id = "53e34b08-0c88-4ce0-a84d-d23056884bda";
          icon = "🎥";
          position = 6000;
        };
      };
    };
    policies = {
      # Feature Disabling
      DisableBuiltinPDFViewer = true;
      DisableFirefoxStudies = true;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisablePasswordReveal = true;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      AutofillCreditCardEnabled = false;

      # Access Restrictions
      BlockAboutConfig = false;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;

      # UI and Behavior
      AutofillAddressEnabled = true;
      DisableFirefoxAccounts = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };

  stylix.targets.zen-browser = {
    enable = false;
  };
}
