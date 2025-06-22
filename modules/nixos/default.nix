{
  imports = [
    ./hardware-configuration.nix
    ./services.nix
    ./packages.nix
    ./kanata.nix
    ./core/security.nix
    ./core/hardware.nix
    ./languages.nix
    ./core/boot.nix
    ./steam.nix
    ./stylix.nix
    ./misc.nix
    # ./nixvim/default.nix
    # nixvim.nixosModules.nixvim
  ];
}
