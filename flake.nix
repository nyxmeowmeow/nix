{
  description = "meow meow meow meow :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";

    niri.url = "github:sodiboo/niri-flake";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    slippi.url = "github:lytedev/slippi-nix";
    nuhxboard.url = "github:justDeeevin/NuhxBoard";
    walker.url = "github:abenz1267/walker";
    pollymc.url = "github:fn2006/PollyMC";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, nixvim, niri, ... }:
  let
    username = "meow";
  in {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs username zen-browser nixvim niri;
        };
        modules = [
          ./hosts/nixos/default.nix
          ./hosts/nixos/home-manager.nix

        {
          nixpkgs.overlays = import ./overlays/default.nix;
        }

        inputs.slippi.nixosModules.default
          ./modules/nixos/slippi.nix
        # {
        #   home-manager = import ./modules/nixos/slippi.nix;
        # }

        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = import ./overlays/default.nix;
        }


        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username inputs;
        };
        modules = [

          ./hosts/laptop/default.nix
          ./hosts/laptop/home-manager.nix




            home-manager.nixosModules.home-manager
#        {
#          nixpkgs.overlays = import ./overlays/default.nix;
#        }
            inputs.stylix.nixosModules.stylix


        ];
      };
    };
  };
}
