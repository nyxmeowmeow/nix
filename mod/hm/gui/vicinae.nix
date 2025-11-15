{
  inputs,
  pkgs,
  config,
  lib,
  theme,
  rounding,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../theme/${theme_trimmed}/colors.nix;
  radius = if rounding then 10 else 0;
  nix-icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
in {

    # install extensions from raycast
    lib.vicinae.mkRayCastExtension = (
      {
        name,
        sha256,
        rev,
      }:
      let
        src =
          pkgs.fetchgit {
            inherit rev sha256;
            url = "https://github.com/raycast/extensions";
            sparseCheckout = [
              "/extensions/${name}"
            ];
          }
          + "/extensions/${name}";
      in
      (pkgs.buildNpmPackage {
        inherit name src;
        installPhase = ''
          runHook preInstall
          mkdir -p $out
          cp -r /build/.config/raycast/extensions/${name}/* $out/
          runHook postInstall
        '';
        npmDeps = pkgs.importNpmLock { npmRoot = src; };
        npmConfigHook = pkgs.importNpmLock.npmConfigHook;
      })
    );

  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;
    # FIXME
    # settings = {
    #   faviconService = "twenty"; # twenty | google | none
    #   font = {
    #     normal = config.stylix.fonts.monospace.name;
    #     size = 12;
    #   };
    #   popToRootOnClose = false;
    #   rootSearch.searchFiles = false;
    #   theme.name = "meow";
    #   themes = {
    #     meow = {
    #       version = "1.0.0";
    #       appearance = "dark";
    #       icon = nix-icon;
    #       name = "meow";
    #       description = "default nix theme";
    #       palette = {
    #         background = col.bg;
    #         foreground = col.fg;
    #         blue = col.blue;
    #         green = col.green;
    #         magenta = col.pink;
    #         orange = col.orange;
    #         purple = col.purple;
    #         red = col.red;
    #         yellow = col.yellow;
    #         cyan = col.cyan;
    #       };
    #     };
    #   };
    #   window = {
    #     csd = false;
    #     opacity = 0.80;
    #     rounding = radius;
    #   };
    # };



    extensions = [
      # https://github.com/nix-community/home-manager/commit/cc837038306d752355d21a4b4620ff589bcd1e71
      (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
        inherit pkgs;
        name = "case-converter";
        src = pkgs.fetchFromGitHub {
        owner = "nyxmeowmeow";
        repo = "vicinae-extensions";
        rev = "12fefbb2f852c38ac1b418c5955ed6ab070bafe3";
        sha256 = "sha256-6eDqc98qzg1y+O7pbfS69gEelTVPqi+7PK7X1a+S5qE=";
      } + "/case-converter";
      })

      # FIXME
      # (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
      #   inherit pkgs;
      #   name = "nix";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "vicinaehq";
      #     repo = "extensions";
      #     rev = "40d795b4f95ce101f49fece3ebd04f350aee4f51";
      #     sha256 = "sha256-j0lhAkRuJ+K0uvSvhiZUgwCskYyfL8TdEdLwAf4t5xw=";
      #   } + "/extensions/nix";
      # })






      # (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
      #   inherit pkgs;
      #   name = "firefox-symbols";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "nyxmeowmeow";
      #     repo = "vicinae-extensions";
      #     rev = "da27028f4c22344cc6e4d4e05e1b6f13235b2f20";
      #     sha256 = "sha256-J0uQtN0/FyuG6YB3FStUg1PTt1JPUxgpopHuPnrINhE=";
      #   } + "/unicode-symbols";
      # })

      # (inputs.vicinae.mkRayCastExtension.${pkgs.system} {
      #   inherit pkgs;
      #   name = "balatro-compendium";
      #   src = pkgs.fetchgit {
      #           url = "https://github.com/raycast/extensions";
      #           sparseCheckout = [
      #             "/extensions/balatro-compendium"
      #           ];
      #         }
      #         + "/extensions/balatro-compendium";
      #
      # })
      # (config.lib.vicinae.mkRayCastExtension {
      # name = "balatro-compendium";
      # sha256 = "sha256-FUunOa2cS4MXZTrQ9CxJA64bc7C4VLQRbrJ3p7mCDOU=";
      # rev = "f4b1ca09af17e754f02437a3f6145f45327892bf";
      # })

      (config.lib.vicinae.mkRayCastExtension {
        name = "oklch-color-converter";
        sha256 = "sha256-wfRJTtMN+IMzGDWl4GaN3EB9v6GmlHdgEqZht8nUikE=";
        rev = "b8c8fcd7ebd441a5452b396923f2a40e879565ba";
      })

      # FIXME curl: command not found
      # (config.lib.vicinae.mkRayCastExtension {
      # name = "minecraft-crafting-recipes";
      # sha256 = "sha256-a+jOMhqaDZwMbUMto25yrxeXlCnIFalIagN6BaISQIE=";
      # rev = "27f8c0185122abdafb7ae932868b15206278a7e3";
      # })

      # FIXME /build/color-shades/node_modules/.bin/ray: line 30: curl: command not found
      # (config.lib.vicinae.mkRayCastExtension {
      # name = "color-shades";
      # sha256 = "sha256-IBbrcliA8sZg/H3GyEw4gs9Sf1NMwmarOVzzmFj8q/Q=";
      # rev = "da1acf4bd2e891fca44f74752d7291eea93d3895";
      # })


      # (config.lib.vicinae.mkRayCastExtension {
      #   name = "easydict";
      #   sha256 = "sha256-BDa7L4TAZhDSIvcYbuRcRhL/nVDxYAd2HQVVTUW1ItI=";
      #   rev = "709e3df645ea4c5748584a5019e8b647510e70f9";
      # })

      (config.lib.vicinae.mkRayCastExtension {
        name = "unicode-symbols";
        sha256 = "sha256-N/PhRxaRu4voslRD5P8Kwn6uBC64lOtqh5ngHnHv9NM=";
        rev = "49b12149b739aab4b3d3a0d922947940b66c3f05";
      })


      ];
};
}
