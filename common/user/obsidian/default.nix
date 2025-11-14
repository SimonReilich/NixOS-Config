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
            settings = {
              "commitMessage" = "vault backup: {{date}}";
              "autoCommitMessage" = "vault backup: {{date}}";
              "commitMessageScript" = "";
              "commitDateFormat" = "YYYY-MM-DD HH:mm:ss";
              "autoSaveInterval" = 10;
              "autoPushInterval" = 0;
              "autoPullInterval" = 0;
              "autoPullOnBoot" = true;
              "autoCommitOnlyStaged" = false;
              "disablePush" = false;
              "pullBeforePush" = true;
              "disablePopups" = false;
              "showErrorNotices" = true;
              "disablePopupsForNoChanges" = false;
              "listChangedFilesInMessageBody" = true;
              "showStatusBar" = true;
              "updateSubmodules" = false;
              "syncMethod" = "merge";
              "customMessageOnAutoBackup" = false;
              "autoBackupAfterFileChange" = false;
              "treeStructure" = false;
              "refreshSourceControl" = true;
              "basePath" = "";
              "differentIntervalCommitAndPush" = false;
              "changedFilesInStatusBar" = false;
              "showedMobileNotice" = true;
              "refreshSourceControlTimer" = 7000;
              "showBranchStatusBar" = true;
              "setLastSaveToLastCommit" = true;
              "submoduleRecurseCheckout" = false;
              "gitDir" = "";
              "showFileMenu" = true;
              "authorInHistoryView" = "hide";
              "dateInHistoryView" = false;
              "diffStyle" = "split";
              "lineAuthor" = {
                "show" = false;
                "followMovement" = "inactive";
                "authorDisplay" = "initials";
                "showCommitHash" = false;
                "dateTimeFormatOptions" = "date";
                "dateTimeFormatCustomString" = "YYYY-MM-DD HH:mm";
                "dateTimeTimezone" = "viewer-local";
                "coloringMaxAge" = "1y";
                "colorNew" = {
                  "r" = 255;
                  "g" = 150;
                  "b" = 150;
                };
                "colorOld" = {
                  "r" = 120;
                  "g" = 160;
                  "b" = 255;
                };
                "textColorCss" = "var(--text-muted)";
                "ignoreWhitespace" = false;
                "gutterSpacingFallbackLength" = 5;
                "lastShownAuthorDisplay" = "initials";
                "lastShownDateTimeFormatOptions" = "date";
              };
            };
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
