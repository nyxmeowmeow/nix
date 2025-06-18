{ pkgs, inputs, ... }: 


let
  # Overlay to override wlr-which-key
  overrides = self: super: {
    wlr-which-key = super.rustPlatform.buildRustPackage rec {
      pname = "wlr-which-key";
      version = "master";

      src = super.fetchFromGitHub {
        owner = "MaxVerevkin";
        repo = "wlr-which-key";
        rev = "master";
        sha256 = "<SHA256‑FOR‑SRC‑HERE>"; # fill this after first build
      };

      cargoSha256 = "<CARGO‑SHARED‑HERE>"; # get this too

      # inherit other build dependencies (pkgs provides these by default)
      nativeBuildInputs = super.rustPlatform.buildRustPackage.nativeBuildInputs;
      buildInputs = super.rustPlatform.buildRustPackage.buildInputs;
      propagatedBuildInputs = super.rustPlatform.buildRustPackage.propagatedBuildInputs;

      meta = with super.stdenv.lib; {
        description = "Keymap manager for wlroots-based compositors (from master)";
        license = licenses.gpl3Only;
        homepage = "https://github.com/MaxVerevkin/wlr-which-key";
      };
    };
  };

  myPkgs = import <nixpkgs> {
    overlays = [ overrides ];
  };
in{

  imports = [
    inputs.niri.homeModules.niri 
    ./settings.nix 
    ./binds.nix 
    ./outputs.nix
    ./layout.nix
    ./animations.nix
    ./startup.nix
    ./window_rules.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    wlr-which-key

    # xdg-desktop-portal-gtk
    # xdg-desktop-portal-gnome
    # gnome-keyring
  ];

  programs.niri.enable = true;
}
