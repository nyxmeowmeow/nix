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

    # mpdfix.url = "github:NixOS/nixpkgs/061295ff547b7d5c3b489076546550e61f509991";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, nixvim, niri, slippi, nuhxboard, ... }:
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

            # {
            #   nixpkgs.overlays = [
            #     (final: prev: {
            #      mpd = inputs.mpdfix.legacyPackages.${final.system}.mpd;
            #      rocmPackages.clr = inputs.mpdfix.legacyPackages.${final.system}.rocmPackages.clr;
            #      })
            #   ];
            # }
        {
          nixpkgs.overlays = import ./overlays/default.nix;
        }

        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = import ./overlays/default.nix;
        }
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = { inherit inputs username; };
        }

        slippi.nixosModules.default
        {
          home-manager = {
# ... snip -- see Home Manager's documentation for details
            users.${username} = {
              imports = [
                slippi.homeManagerModules.default
                {
# use your path
                  slippi-launcher.isoPath = "/home/${username}/melee/meow.iso";
                  slippi-launcher.launchMeleeOnPlay = false;
                  slippi-launcher.enableJukebox = false;
                }
              ];
            };
          };
        }

        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username inputs;
        };
        modules = [

          ./hosts/laptop/default.nix




            home-manager.nixosModules.home-manager
#        {
#          nixpkgs.overlays = import ./overlays/default.nix;
#        }
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bak";
              home-manager.extraSpecialArgs = { inherit inputs username; };
            }
        inputs.stylix.nixosModules.stylix


        ];
      };


    };
  };
}
