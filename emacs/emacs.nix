{ config, lib, pkgs, ... }:

let
  emacsConfigDir = "${config.home.homeDirectory}/nix/emacs";
in
{
  home.packages = [ pkgs.emacs ];

  # Optional: set environment variable so Emacs loads the config
  home.sessionVariables = {
    EMACSDIR = emacsConfigDir;
  };

  # Symlink ~/.emacs.d to ~/nix/emacs
  home.file.".emacs.d".source = emacsConfigDir;
}
