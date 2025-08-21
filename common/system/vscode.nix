{ config, pkgs, ... }:

{
  users.users.simonr.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        brettm12345.nixfmt-vscode
        ocamllabs.ocaml-platform
        piousdeer.adwaita-theme
        james-yu.latex-workshop
      ];
    })
  ];
}
