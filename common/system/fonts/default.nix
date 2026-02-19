{ inputs, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  # Install the font
  fonts.packages = [
    (pkgs.stdenv.mkDerivation {
      pname = "google-sans-flex";
      version = "1.0";
      src = ./google-sans;
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp -r *.ttf $out/share/fonts/truetype
      '';
    })
  ]
  ++ (with pkgs; [
    roboto-flex
    roboto-serif
    roboto-mono
  ]);
}
