{ pkgs, ... }: {
  home.packages = [ pkgs.emacs ];

  home.sessionVariables = {
    EMACSDIR = ./emacs;
    EMACSLOADPATH= ./emacs;
  };
  
  # ln -sfn ~/nix/emacs ~/.emacs.d
}
