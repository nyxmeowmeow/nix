{
  description = "meow meow meow meow :3";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    stylix.url = "github:danth/stylix";


    niri.url = "github:sodiboo/niri-flake";
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # textfox.url = "github:adriankarlen/textfox";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    slippi.url = "github:lytedev/slippi-nix";
    # nuhxboard.url = "github:justDeeevin/NuhxBoard";
    pollymc.url = "github:fn2006/PollyMC";
    # moonlight = {
    #   url = "github:moonlight-mod/moonlight"; # Add `/develop` to the flake URL to use nightly.
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };

    # elephant.url = "github:abenz1267/elephant";
    # walker = {
    #   url = "github:abenz1267/walker";
    #   inputs.elephant.follows = "elephant";
    # };
    vicinae.url = "github:vicinaehq/vicinae";


    ytsub.url = "github:/sarowish/ytsub";

    # ags.url = "github:aylur/ags";
    # meow-shell.url = "github:nyxmeowmeow/shell";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    zen-browser,
    nixvim,
    niri,
    nur,
    ...
  }:
  let
    username = "meow";
    flake_dir = "/home/${username}/nix";
    flake_ns_path = builtins.toString ./.; # flake nix store path
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs username flake_dir zen-browser nixvim niri;
        };
        modules = [
          ./host/nixos/default.nix
          ./host/nixos/hm.nix

        {
          nixpkgs.overlays = import ./over/default.nix;
        }
        nur.modules.nixos.default

        inputs.slippi.nixosModules.default
          ./mod/os/slippi.nix
        # {
        #   home-manager = import ./modules/nixos/slippi.nix;
        # }

        # inputs.mango.nixosModules.mango
        # # ./modules/home-manager/gui/mango/mango.nix
        # {
        #   programs.mango.enable = true;
        # }

        inputs.stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = import ./over/default.nix;
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

          ./host/laptop/default.nix
          ./host/laptop/hm.nix




            home-manager.nixosModules.home-manager
#        {
#          nixpkgs.overlays = import ./over/default.nix;
#        }
            inputs.stylix.nixosModules.stylix


        ];
      };
    };
  };
}
