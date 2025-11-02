{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        astro-build.astro-vscode
        bbenoist.nix
        brettm12345.nixfmt-vscode
        haskell.haskell
        james-yu.latex-workshop
        justusadam.language-haskell
        myriad-dreamin.tinymist
        ocamllabs.ocaml-platform
        piousdeer.adwaita-theme
        rust-lang.rust-analyzer
        streetsidesoftware.code-spell-checker
        streetsidesoftware.code-spell-checker-german
        vue.volar
      ];
    })
  ];

  programs.code-nautilus.enable = true;
}
