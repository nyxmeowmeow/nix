{ pkgs, ... }: {
  home.packages = [ pkgs.emacs ];

  home.sessionVariables = {
    EMACSDIR = ./emacs;
  };
}
