{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.homepage";
  version = "4.2.2";
  repo = "https://github.com/mirnovov/obsidian-homepage";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-MD6RiN42iOI2SSe12mOqoilp6sii+rRw9aHkha+sBSw=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-hgv+W9zxFdbMrJDbwl5k8QwY1pwLRZrGMoBk0lo7ajg=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-hgv+W9zxFdbMrJDbwl5k8QwY1pwLRZrGMoBk0lo7ajg=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
