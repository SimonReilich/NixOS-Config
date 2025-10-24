{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cabal-install
    ghc
    haskell-language-server

    haskellPackages.bytestring_0_12_2_0
    haskellPackages.network
    haskellPackages.monad-logger
    haskellPackages.random
    haskellPackages.snap
    haskellPackages.containers_0_8
    haskellPackages.test-framework
    haskellPackages.vector
    haskellPackages.time_1_15
    haskellPackages.mwc-random
  ];
}
