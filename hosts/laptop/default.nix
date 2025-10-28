{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./configuration.nix
    # ./kanata.nix
    ./packages.nix
    ./services.nix
    ../../modules/nixos/options.nix
    ../../modules/nixos/config.nix
    ../../modules/nixos/font.nix
    ../../modules/nixos/shared.nix
    ../../modules/nixos/stylix.nix
#    ../../themes/blacchiato/nixos/default.nix
#    ../../themes/everforest/nixos/default.nix
#    ../../themes/lix/nixos/default.nix
#    ../../themes/macchiato/nixos/default.nix
  ];
}
