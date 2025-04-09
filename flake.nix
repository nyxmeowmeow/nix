{
  description = "meow meow meow meow :3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    ssbm-nix.url = "github:djanatyn/ssbm-nix";
    nixos-cli.url = "github:water-sucks/nixos";
    flake-utils.url = "github:numtide/flake-utils";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up to date or simply don't specify the nixpkgs input  
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ssbm-nix, nixos-cli, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {

      }
    ) // {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            nixos-cli.nixosModules.nixos-cli
            {
              services.nixos-cli = {
                enable = true;
                # aliases = [
                  # genlist = ["generation", "list"]
                  # switch = ["generation", "switch"]
                  # rollback = ["generation", "rollback"]
                # ];
              };
            }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.meow = import ./home.nix;
            }
          ];
        };
      };
    };
}

