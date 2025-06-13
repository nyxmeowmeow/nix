{ pkgs, ... }: {

programs.emacs = {
enable = true;
package = pkgs.emacs-gtk;
};

  home.sessionVariables = {
    EMACSDIR = ./emacs;
    EMACSLOADPATH= ./emacs;
  };
  
  # ln -sfn ~/nix/emacs ~/.emacs.d
}
