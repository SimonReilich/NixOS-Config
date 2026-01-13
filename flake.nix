{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    helium = {
      url = "github:FKouhai/helium2nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    affinity-nix = {
      url = "github:mrshmllow/affinity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    popprotosim-neo = {
      url = "github:SimonReilich/PopProtoSim-Neo";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zsh-plugins = {
      url = "github:SimonReilich/Zsh-Plugin-Flake";
    };

    obsidian-plugins = {
      url = "github:SimonReilich/Obsidian-Plugin-Flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-hardware,
      home-manager,
      lanzaboote,
      stylix,
      nix-flatpak,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
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
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };

        tablet = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
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
            lanzaboote.nixosModules.lanzaboote
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak

            # Fixing broken hidrd-package
            {
              nixpkgs.overlays = [
                (final: prev: {
                  hidrd = prev.hidrd.overrideAttrs (oldAttrs: {
                    postPatch = ''
                      substituteInPlace lib/util/hex.c \
                        --replace "map[16]" "map[17]"
                    '';
                  });
                })
              ];
            }
          ];
        };
      };
    };
}
