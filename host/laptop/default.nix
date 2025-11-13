{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./configuration.nix
    # ./kanata.nix
    ./packages.nix
    ./services.nix
    ../../mod/os/options.nix
    ../../mod/os/cleanup.nix
    ../../mod/os/config.nix
    ../../mod/os/font.nix
    ../../mod/os/shared.nix
    ../../mod/os/stylix.nix
#    ../../theme/blacchiato/os/default.nix
#    ../../theme/everforest/os/default.nix
#    ../../theme/lix/os/default.nix
#    ../../theme/macchiato/os/default.nix
  ];
}
