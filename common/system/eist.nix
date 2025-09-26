{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.requests
    ]))

    libgcc
  ];
}
