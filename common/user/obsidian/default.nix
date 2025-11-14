{
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs.obsidian = {
    enable = true;

    vaults.Obsidian = {
      enable = true;
      target = "Documents/Obsidian";
      settings = {
        communityPlugins = [
          {
            pkg = pkgs.callPackage ./homepage { };
            enable = true;
            settings = {
              "version" = 4;
              "homepages" = {
                "Main Homepage" = {
                  "value" = "Home";
                  "kind" = "Graph view";
                  "openOnStartup" = true;
                  "openMode" = "Replace all open notes";
                  "manualOpenMode" = "Keep open notes";
                  "view" = "Default view";
                  "revertView" = true;
                  "openWhenEmpty" = true;
                  "refreshDataview" = false;
                  "autoCreate" = false;
                  "autoScroll" = false;
                  "pin" = false;
                  "commands" = [ ];
                  "alwaysApply" = false;
                  "hideReleaseNotes" = false;
                };
              };
              "separateMobile" = false;
            };
          }

          {
            pkg = pkgs.callPackage ./obsidian-git { };
            enable = true;
          }

          {
            pkg = pkgs.callPackage ./obsidian-note-linker { };
            enable = true;
          }

          {
            pkg = pkgs.callPackage ./obsidian-book-search-plugin { };
            enable = true;
            settings = {
              "folder" = "Literatur";
              "fileNameFormat" = "";
              "frontmatter" = "";
              "content" = "";
              "useDefaultFrontmatter" = true;
              "defaultFrontmatterKeyType" = "Camel Case";
              "templateFile" = "_templates/BuchTemplate.md";
              "serviceProvider" = "google";
              "naverClientId" = "";
              "naverClientSecret" = "";
              "localePreference" = "de";
              "apiKey" = "";
              "openPageOnCompletion" = true;
              "showCoverImageInSearch" = true;
              "enableCoverImageSave" = true;
              "enableCoverImageEdgeCurl" = true;
              "coverImagePath" = "Literatur/Bilder";
              "askForLocale" = true;
            };
          }

          {
            pkg = pkgs.callPackage ./tag-wrangler { };
            enable = true;
          }
        ];

        app = {
          "alwaysUpdateLinks" = true;
        };
        appearance = {
          "cssTheme" = "Adwaita";
          "accentColor" = "#3971ed";
          "theme" = "system";
        };
      };
    };
  };

  stylix.targets.obsidian.enable = false;
}
