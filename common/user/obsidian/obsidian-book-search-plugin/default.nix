{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.obsidian-book-search-plugin";
  version = "0.7.5";
  repo = "https://github.com/anpigon/obsidian-book-search-plugin";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-H0wByq1CvMz9IriNjkArBnSPuG2LyNpj3auENwBq53k=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-X63gI+w1iv+3ESVb5ZKkS0QsSCQ0Ew9UHyBA4JdPHDc=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-X63gI+w1iv+3ESVb5ZKkS0QsSCQ0Ew9UHyBA4JdPHDc=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
