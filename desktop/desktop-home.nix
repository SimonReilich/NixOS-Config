{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../computer/home.nix
    ./user
  ];
}
