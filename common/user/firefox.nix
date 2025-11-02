{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "de"
    ];
    profiles.simon = {
      name = "simon";
      settings = {
        "browser.search.region" = "DE";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "de";
        "general.useragent.locale" = "de";
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.newtabpage.pinned" = [
          {
            title = "YouTube";
            url = "https://www.youtube.com/";
          }
          {
            title = "GitHub";
            url = "https://www.github.com/";
          }
          {
            title = "Proton Mail";
            url = "https://mail.proton.me/";
          }
          {
            title = "Proton Lumo";
            url = "https://lumo.proton.me/";
          }
          {
            title = "ReMarkable";
            url = "https://my.remarkable.com/myfiles";
          }
          {
            title = "OneDrive";
            url = "https://onedrive.live.com/";
          }
          {
            title = "Overleaf";
            url = "https://www.overleaf.com/";
          }
          {
            title = "Wikipedia";
            url = "https://www.wikipedia.org/";
          }
          {
            title = "Nix Package Search";
            url = "https://search.nixos.org/packages";
          }
          {
            title = "NixOS Options";
            url = "https://mynixos.com/";
          }
          {
            title = "TUM Moodle";
            url = "https://www.moodle.tum.de/";
          }
          {
            title = "Artemis";
            url = "https://artemis.tum.de/courses";
          }
          {
            title = "TUM Live";
            url = "https://live.rbg.tum.de/";
          }
          {
            title = "TUM Online";
            url = "https://campus.tum.de/tumonline/";
          }
          {
            title = "ConPra";
            url = "https://judge.db.cit.tum.de/c/conpra-2526/dashboard/";
          }
          {
            title = "Team VaultWarden";
            url = "https://passwort.teilzeitchaoten.de/#/vault";
          }
        ];
      };
      isDefault = true;
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          proton-pass
          zotero-connector
        ];
      };
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

          google.metaData.alias = "@g";
        };
      };
    };
  };
}
