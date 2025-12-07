{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.obsidian-note-linker";
  version = "1.2.9";
  repo = "https://github.com/AlexW00/obsidian-note-linker";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-SBO/Ti5uiuQTm1L796jfxPzNG6e06bAsefXx2EzZ8rM=";
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
