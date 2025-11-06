{
  inputs,
  pkgs,
  config,
    ...
}: {

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
# settings = {
#     faviconService = "twenty"; # twenty | google | none
#     font.size = 11;
#     popToRootOnClose = false;
#     rootSearch.searchFiles = false;
#     theme.name = "vicinae-dark";
#     window = {
#       csd = true;
#       opacity = 0.95;
#       rounding = 10;
#     };
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
  #   name = "unicode-symbols";
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
  (config.lib.vicinae.mkRayCastExtension {
  name = "gif-search";
  sha256 = "sha256-G7il8T1L+P/2mXWJsb68n4BCbVKcrrtK8GnBNxzt73Q=";
  rev = "4d417c2dfd86a5b2bea202d4a7b48d8eb3dbaeb1";
  })
];
  };
}
