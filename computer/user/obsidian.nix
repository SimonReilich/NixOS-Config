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
            pkg = inputs.obsidian-plugins.packages.x86_64-linux.git;
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
            pkg = inputs.obsidian-plugins.packages.x86_64-linux.note-linker;
            enable = true;
          }

          {
            pkg = inputs.obsidian-plugins.packages.x86_64-linux.tag-wrangler;
            enable = true;
          }

          {
            pkg = inputs.obsidian-plugins.packages.x86_64-linux.graph-banner;
            enable = true;
          }

          {
            pkg = inputs.obsidian-plugins.packages.x86_64-linux.templater;
            enable = true;
            settings = {
              "command_timeout" = 5;
              "templates_folder" = "Vorlagen";
              "templates_pairs" = [ ];
              "trigger_on_file_creation" = true;
              "auto_jump_to_cursor" = false;
              "enable_system_commands" = false;
              "shell_path" = "";
              "user_scripts_folder" = "";
              "enable_folder_templates" = true;
              "folder_templates" = [
                {
                  "folder" = "Bücher";
                  "template" = "Vorlagen/Buch Vorlage.md";
                }

                {
                  "folder" = "Literatur";
                  "template" = "Vorlagen/Literatur Vorlage.md";
                }

                {
                  "folder" = "Videos";
                  "template" = "Vorlagen/Video Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Chemie";
                  "template" = "Vorlagen/Oberstufe/Chemie Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Deutsch";
                  "template" = "Vorlagen/Oberstufe/Deutsch Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Geschichte";
                  "template" = "Vorlagen/Oberstufe/Geschichte Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Informatik";
                  "template" = "Vorlagen/Oberstufe/Informatik Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Mathematik";
                  "template" = "Vorlagen/Oberstufe/Mathematik Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Musik";
                  "template" = "Vorlagen/Oberstufe/Musik Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Physik";
                  "template" = "Vorlagen/Oberstufe/Physik Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Politik";
                  "template" = "Vorlagen/Oberstufe/Politik Vorlage.md";
                }

                {
                  "folder" = "Oberstufe/Religion";
                  "template" = "Vorlagen/Oberstufe/Religion Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Algorithmen für Programmierwettbewerbe";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/ConPra Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Analysis für Informatik";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/AnaInfo Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Diskrete Strukturen";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/DS Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Diskrete Wahrscheinlichkeitstheorie";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/DWT Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Einführung in die Informatik";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/EidI Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Einführung in die Rechnerarchitektur";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/ERA Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Einführung in die Softwaretechnik";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/EiSt Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Einführung in die Theoretische Informatik";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/Theo Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Funktionale Programmierung und Verifikation";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/FPV Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagen Algorithmen und Datenstrukturen";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/GAD Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagen Betriebssysteme und Systemsoftware";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/GBS Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagen Datenbanken";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/GDB Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagen Rechnernetze und Verteilte Systeme";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/GRnVs Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagenpraktikum Programmierung";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/PGdP Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Grundlagenpraktikum Rechnerarchitektur";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/GRA Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/IT Sicherheit";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/ITSec Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Lineare Algebra für Informatik";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/LAInfo Vorlage.md";
                }

                {
                  "folder" = "Studium/Bachelor Informatik/Numerisches Programmieren";
                  "template" = "Vorlagen/Studium/Bachelor Informatik/NumProg Vorlage.md";
                }
              ];
              "enable_file_templates" = false;
              "file_templates" = [ ];
              "syntax_highlighting" = true;
              "syntax_highlighting_mobile" = false;
              "enabled_templates_hotkeys" = [ ];
              "startup_templates" = [ ];
              "intellisense_render" = 1;
            };
          }
        ];

        app = {
          "alwaysUpdateLinks" = true;
          "newFileLocation" = "current";
        };
        appearance = {
          "cssTheme" = "Adwaita";
          "accentColor" = "#3971ed";
          "theme" = "system";
        };
        cssSnippets = [
          {
            name = "Hardcover Books";
            enable = true;
            text = ''
              body:has(.workspace-tab-header.is-active[aria-label="Bibliothek"]) {

                  .bases-view {
                    --bases-cards-background: transparent;
                    --bases-cards-cover-background: transparent;
                    --bases-cards-shadow: none;
                    --bases-cards-shadow-hover: none;
                  }

                  .bases-cards-group {
                    gap: 20px;
                    padding: 20px;
                  }

                  .bases-cards-label {
                    display: none;
                  }

                  .bases-cards-item {
                    overflow: visible;
                    gap: 0px;
                    contain: inherit;
                  }

                  .bases-cards-property.mod-title {
                    padding-top: 10px;
                  }

                  .bases-cards-cover {
                    transition: transform 0.1s ease-out, box-shadow 0.1s ease-out;
                    border-radius: 2px 6px 6px 2px;
                    box-shadow: inset 1px 1px 0 1px rgba(255,255,255,0.2), inset 0 0 0 1px rgba(0,0,0,0.1), -4px 2px 4px 0 rgba(0,0,0,0.3), -8px 8px 20px 0 rgba(0,0,0,0.2);
                  }

                  .bases-cards-cover:before {
                    content: "";
                    background-image: linear-gradient(to right, rgba(0,0,0,0.2), rgba(255,255,255,0.3) 1%, transparent 4%, rgba(0,0,0,0.15) 6%, rgba(255,255,255,0.2) 7%, transparent 20%);
                    width: 100%;
                    position: absolute;
                    height: 100%;
                  }

                  .bases-cards-item:hover .bases-cards-cover {
                    transform: translateY(-4px) scale(1.03);
                    box-shadow: inset 1px 1px 0 1px rgba(255,255,255,0.2), inset 0 0 0 1px rgba(0,0,0,0.1), -4px 4px 8px 0 rgba(0,0,0,0.3), -12px 16px 30px 0 rgba(0,0,0,0.3);
                  }

                  .bases-cards-property.mod-title .bases-cards-line {
                    font-size: var(--font-ui-small);
                    line-height: 1.2;
                    height: 2.08em;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: normal;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                  }
              }
            '';
          }
          {
            name = "Video Player";
            enable = true;
            text = ''
              body:has(.workspace-tab-header.is-active[aria-label="Videothek"]) {

                  .bases-view {
                    --bases-cards-background: transparent;
                    --bases-cards-cover-background: transparent;
                    --bases-cards-shadow: none;
                    --bases-cards-shadow-hover: none;
                  }

                  .bases-cards-group {
                    gap: 20px;
                    padding: 20px;
                  }

                  .bases-cards-label {
                    display: none;
                  }

                  .bases-cards-item {
                    overflow: visible;
                    gap: 0px;
                    contain: inherit;
                  }

                  .bases-cards-property.mod-title {
                    padding-top: 10px;
                  }

                  .bases-cards-cover {
                    transition: transform 0.1s ease-out, box-shadow 0.1s ease-out;
                    border-radius: 12px;
                    box-shadow:
                      inset 0 1px 0 1px rgba(255,255,255,0.1),
                      inset 0 0 0 1px rgba(0,0,0,0.1),
                      0 4px 10px 0 rgba(0,0,0,0.2),
                      0 8px 20px 0 rgba(0,0,0,0.1);
                  }

                  .bases-cards-item:hover .bases-cards-cover {
                    transform: translateY(-4px) scale(1.03);
                    box-shadow:
                      inset 0 1px 0 1px rgba(255,255,255,0.1),
                      inset 0 0 0 1px rgba(0,0,0,0.1),
                      0 10px 20px 0 rgba(0,0,0,0.2),
                      0 15px 40px 0 rgba(0,0,0,0.2);
                  }

                  .bases-cards-property.mod-title .bases-cards-line {
                    font-size: var(--font-ui-small);
                    line-height: 1.2;
                    height: 2.08em;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: normal;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                  }
              }
            '';
          }
        ];
      };
    };
  };

  stylix.targets.obsidian.enable = false;
}
