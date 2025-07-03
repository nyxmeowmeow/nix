{
  imports = [


    ./audio.nix
    ./boot.nix
    ./hardware-configuration.nix
    ./configuration.nix
    ./packages.nix
    ../../modules/nixos/core/hardware.nix
    ../../modules/nixos/core/nix.nix
    ../../modules/nixos/core/nixpkgs.nix
    ../../modules/nixos/core/security.nix
    ../../modules/nixos/core/services.nix
    ../../modules/nixos/nix-gaming.nix
    ../../modules/nixos/clipse.nix
    ../../modules/nixos/font.nix
    ../../modules/nixos/fontconfig.nix
    ../../modules/nixos/kanata.nix
    ../../modules/nixos/languages.nix
    ../../modules/nixos/misc.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/stylix.nix
    # ./nixvim/default.nix
    # nixvim.nixosModules.nixvim
    ../../themes/black/nixos/default.nix
    ../../themes/everforest/nixos/default.nix
    ../../themes/lix/nixos/default.nix
    ../../themes/macchiato/nixos/default.nix
    ../../themes/ocean/nixos/default.nix
  ];
}
