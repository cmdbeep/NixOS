{ pkgs, unstable, ... }:
{
  programs.vscode = {
    enable = true;
    package = unstable.vscodium;
    profiles = {
      finnh = {
        enableUpdateCheck = false;
        extensions =
          with pkgs.vscode-extensions;
          [
            christian-kohler.path-intellisense
            eamodio.gitlens
            jnoortheen.nix-ide
            mhutchie.git-graph
            dracula-theme.theme-dracula
          ]
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "apc-extension";
              publisher = "drcika";
              version = "0.4.1";
              sha256 = "fq2qlxc7+MpwkraVClB0FGsR0K1/2MTzQ0SYULMx4Kg=";
            }
            {
              name = "opencode";
              publisher = "sst-dev";
              version = "0.0.12";
              sha256 = "sha256-0Bql5AWQKw2937sfjm22mi675kAyh8v447b+IjkGKjU=";
            }
            {
              name = "radicle";
              publisher = "radicle-ide-plugins-team";
              version = "0.6.0";
              sha256 = "0jrFJltfj116T8WHTPEPIeiMIjpmEXhOpqFTV4ISxPE=";
            }
            {
              name = "vscode-animations";
              publisher = "brandonkirbyson";
              version = "2.0.1";
              sha256 = "t1Kiz3SZhhxGiu+Bng0J4C98Kz9lXapPN6ncGTXAvEE=";
            }
          ];
        userSettings = {
          "update.mode" = "none";
          "workbench.colorTheme" = "Dracula Theme";
          "editor.cursorBlinking" = "smooth";
          "[nix]" = {
            "editor.insertSpaces" = true;
            "editor.tabSize" = 2;
            "editor.defaultFormatter" = "jnoortheen.nix-ide";
            "editor.formatOnSave" = true;
          };
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "nix.formatterPath" = "nixfmt";
          "nix.serverSettings" = {
            "nixd" = {
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
              "options" = {
                "enable" = true;
                "target" = {
                  "args" = [ ];
                  "installable" = "";
                };
              };
            };
          };
          "files.associations" = {
            "*.nix" = "nix";
            "flake.lock" = "json";
          };
          "editor.fontFamily" = "Maple Mono NF";
          "editor.fontLigatures" = true;
          "editor.fontSize" = 16;
          "editor.fontWeight" = 450;
          "editor.formatOnPaste" = true;
          "editor.mouseWheelZoom" = true;
          "editor.formatOnSave" = true;
          "editor.tabSize" = 2;
          "editor.lineHeight" = 1.6;
          "files.autoSave" = "afterDelay";
          "editor.wordWrap" = "on";
          "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
          "editor.guides.bracketPairs" = true;
          "editor.semanticHighlighting.enabled" = true;
          "workbench.preferredDarkColorTheme" = "Dracula Theme";
          "workbench.preferredLightColorTheme" = "Dracula Theme Soft";
          "workbench.tree.enableStickyScroll" = false;
          "workbench.tips.enabled" = false;
          "telemetry.feedback.enabled" = false;
          "editor.autoIndentOnPaste" = true;
          "breadcrumbs.enabled" = false;
          "apc.imports" = [
            "file:///home/finnh/.vscode-oss/extensions/brandonkirbyson.vscode-animations-2.0.1-universal/dist/updateHandler.js"
          ];
          "window.menuBarVisibility" = "hidden";
          "workbench.layoutControl.enabled" = false;
          "window.commandCenter" = false;
          "workbench.navigationControl.enabled" = false;
        };
      };
    };
  };
}