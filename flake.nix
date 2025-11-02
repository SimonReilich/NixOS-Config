{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      firefox-addons,
      firefox-gnome-theme,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./desktop/desktop-config.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.simonr = import ./desktop/desktop-home.nix;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            stylix.nixosModules.stylix
          ];
        };

        tablet = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./tablet/tablet-config.nix
            nixos-hardware.nixosModules.microsoft-surface-pro-intel
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.simonr = import ./tablet/tablet-home.nix;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            stylix.nixosModules.stylix
          ];
        };
      };
    };
}
