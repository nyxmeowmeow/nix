{
  imports = [
    ./core/boot.nix
    ./core/hardware-configuration.nix
    ./core/hardware.nix
    ./core/nix.nix
    ./core/nixpkgs.nix
    ./core/packages.nix
    ./core/security.nix
    ./core/services.nix
    ./kanata.nix
    ./languages.nix
    ./misc.nix
    ./steam.nix
    ./stylix.nix
    # ./nixvim/default.nix
    # nixvim.nixosModules.nixvim
  ];
}
