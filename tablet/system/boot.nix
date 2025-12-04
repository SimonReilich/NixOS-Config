{ config, pkgs, ... }:

{
  boot.kernelPatches = [
    {
      name = "rust-1.91-fix";
      patch = ./patches/rust-fix.patch;
    }
  ];
}
