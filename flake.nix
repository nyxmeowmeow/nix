{
  description = "meow meow meow meow :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    stylix.url = "github:danth/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    slippi.url = "github:lytedev/slippi-nix";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nuhxboard.url = "github:justDeeevin/NuhxBoard";

    mpdfix.url = "github:NixOS/nixpkgs/061295ff547b7d5c3b489076546550e61f509991";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, nixvim, niri, slippi, nuhxboard, ... }:
let
  username = "meow";
in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit username inputs zen-browser nixvim niri;
      };
      modules = [
        ./modules/nixos/default.nix
        ./modules/home-manager/default.nix
        ./modules/nixos/options.nix

        {
          nixpkgs.overlays = [
            (final: prev: {
             mpd = inputs.mpdfix.legacyPackages.${final.system}.mpd;
             rocmPackages.clr = inputs.mpdfix.legacyPackages.${final.system}.rocmPackages.clr;
             })
          ];
        }
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
  };
}
