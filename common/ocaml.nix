{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ocaml
    opam
    ocamlPackages.ocamlformat
  ];
}
