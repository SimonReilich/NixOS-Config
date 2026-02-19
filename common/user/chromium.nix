{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;

    extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde"
      "ekhagklcjbdpajgpjgmbionohlpdbjgc"
    ];
  };
}
