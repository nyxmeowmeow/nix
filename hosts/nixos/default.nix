{
  imports = [


    ./boot.nix
    ./hardware-configuration.nix
    ./configuration.nix
    ./packages.nix
    ./services.nix
    ./kanata.nix



    ../../modules/nixos/core/hardware.nix
    ../../modules/nixos/core/nix.nix
    ../../modules/nixos/core/nixpkgs.nix
    ../../modules/nixos/core/security.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/clipse.nix
    ../../modules/nixos/font.nix
    ../../modules/nixos/fontconfig.nix
    ../../modules/nixos/dev.nix
    ../../modules/nixos/misc.nix
    ../../modules/nixos/nix-gaming.nix
    ../../modules/nixos/options.nix
    ../../modules/nixos/shared.nix
    ../../modules/nixos/steam.nix
    ../../modules/nixos/stylix.nix
    # ./nixvim/default.nix
    # nixvim.nixosModules.nixvim








    ../../themes/black/nixos/default.nix
    ../../themes/everforest/nixos/default.nix
    ../../themes/lix/nixos/default.nix
    ../../themes/macchiato/nixos/default.nix
  ];
}
