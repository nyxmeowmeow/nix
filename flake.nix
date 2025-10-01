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
    # nuhxboard.url = "github:justDeeevin/NuhxBoard";
    # walker.url = "github:abenz1267/walker";
    pollymc.url = "github:fn2006/PollyMC";
    # moonlight = {
    #   url = "github:moonlight-mod/moonlight"; # Add `/develop` to the flake URL to use nightly.
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, nixvim, niri, ... }:
  let
    username = "meow";
    flake_dir = "/home/${username}/nix";
  in {
    nixosConfigurations = {

      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs username flake_dir zen-browser nixvim niri;
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

        # inputs.walker.nixosModules.walker
        # {
        # programs.walker.enable = true;
        # }

        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username flake_dir inputs;
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
