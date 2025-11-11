{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.obsidian-note-linker";
  version = "1.2.8";
  repo = "https://github.com/AlexW00/obsidian-note-linker";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-PJtyK5By2kUc+JqGeB5tpj3TuDgFQXeSsXKbck/F7xM=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-9vtwGe8s81RMvXDE4NVFjIWzT935qjBj92OV6kVGebU=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-9vtwGe8s81RMvXDE4NVFjIWzT935qjBj92OV6kVGebU=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
