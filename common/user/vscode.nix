{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        astro-build.astro-vscode
        bbenoist.nix
        brettm12345.nixfmt-vscode
        github.vscode-github-actions
        Google.gemini-cli-vscode-ide-companion
        haskell.haskell
        james-yu.latex-workshop
        jnoortheen.nix-ide
        justusadam.language-haskell
        mkhl.direnv
        myriad-dreamin.tinymist
        ocamllabs.ocaml-platform
        piousdeer.adwaita-theme
        redhat.java
        rust-lang.rust-analyzer
        streetsidesoftware.code-spell-checker
        streetsidesoftware.code-spell-checker-german
        usernamehw.errorlens
        vue.volar
      ];
    })

    code-nautilus
  ];
}
