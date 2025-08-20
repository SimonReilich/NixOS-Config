{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dune_3
    ocaml
    opam
    ocamlPackages.ocamlformat
    ocamlPackages.ocaml-lsp
  ];
}
