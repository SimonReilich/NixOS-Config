{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../common/home.nix
    ./user
  ];
}
