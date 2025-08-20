{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      lanzaboote, 
      ...
    }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./desktop.nix
          ];
        };

        tablet = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./tablet.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };
    };
}
