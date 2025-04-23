
{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    defaultKeymap = "emacs";

    # dirHashes = {
    #   doc  = "$HOME/Documents";
    #   vid  = "$HOME/Videos";
    #   dl   = "$HOME/Downloads";
    # };

    dotDir = ".config/zsh";

    # history.ignorePatterns = []

    history.path = "$ZDOTDIR/.zsh_history";

  };
}
