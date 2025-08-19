{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware }: {

    nixosConfigurations.tablet = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./tablet.nix 
        nixos-hardware.nixosModules.microsoft-surface-pro-intel
      ];
    };
  };
}