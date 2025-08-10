{ pkgs, ... }: {
  programs.emacs = {
    enable = false;
    package = pkgs.emacs-gtk;
  };

  home.sessionVariables = {
    EMACSDIR = ./emacs;
    EMACSLOADPATH= ./emacs;
  };

# ln -sfn ~/nix/emacs ~/.emacs.d
}
