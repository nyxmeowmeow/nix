{
  description = "meow meow meow meow :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up to date or simply don't specify the nixpkgs input  
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, zen-browser, ... }: {

    apps.x86_64-linux.default = {
      type = "app";
      program = "${nixpkgs.legacyPackages.x86_64-linux.python3.withPackages (ps: [ ps.pillow ])}/bin/python ${./hextoimg.py}";
    };


    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix

        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.meow = import ./home.nix;
            # pkgs = nixpkgs.legacyPackages."x86_64-linux";
            # inherit pkgs inputs;
            # zen-browser = inputs.zen-browser.packages."x86_64-linux".default;
          # };
        }

      ];
      specialArgs = {
        inherit zen-browser;
      };
    };
  };
}
