{
  description = "meow meow meow meow :3";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    stylix.url = "github:danth/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up to date or simply don't specify the nixpkgs input  
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    slippi.url = "github:lytedev/slippi-nix";

    mpdfix.url = "github:NixOS/nixpkgs/061295ff547b7d5c3b489076546550e61f509991";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, nixvim, niri, slippi, ... }: {



    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
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






        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }

        slippi.nixosModules.default
        {
          home-manager = {
            # ... snip -- see Home Manager's documentation for details
            users.meow = {
              imports = [
                slippi.homeManagerModules.default
                {
                  # use your path
                  slippi-launcher.isoPath = "/home/meow/melee/meow.iso";
                  slippi-launcher.launchMeleeOnPlay = false;
                  slippi-launcher.enableJukebox = false;
                }
              ];
            };
          };
        }

      ];
      specialArgs = {
        inherit inputs zen-browser nixvim niri;
      };
    };
  };
}
