{ config, pkgs, ... }:

{
  users.users.simonr.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        astro-build.astro-vscode
        bbenoist.nix
        brettm12345.nixfmt-vscode
        myriad-dreamin.tinymist
        ocamllabs.ocaml-platform
        piousdeer.adwaita-theme
        james-yu.latex-workshop
        vue.volar
      ];
    })
  ];
}
