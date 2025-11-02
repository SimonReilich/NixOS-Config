{
  config,
  pkgs,
  nur,
  ...
}:

{
  imports = [
    ../common/home.nix
    ./user
  ];
}
