
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

    # plugins = [
    #   {
    #     # will source zsh-autosuggestions.plugin.zsh
    #     name = "zsh-autosuggestions";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "zsh-users";
    #       repo = "zsh-autosuggestions";
    #       rev = "v0.4.0";
    #       sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
    #     };
    #   }
    # ];

    prezto = {
      enable = true;
      caseSensitive = false;
      editor = {

        dotExpansion = true;
        promptContext = true;
      };

    };

  };
}
