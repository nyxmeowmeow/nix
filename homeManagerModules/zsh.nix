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

    syntaxHighlighting = {
      enable = true;

    };

    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];

    # shellGlobalAliases

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      sudo="sudo -k"; # prompt every time
      s="sudo -k"; # prompt every time
      rm="rm -i"; # prompt every time
      mv="mv -i"; # prompt every time
      ln="ln -i"; # prompt every time


      logout="hyprctl dispatch exit 0";
      c="clear"; # clear terminal
      l="eza -lh  --icons=auto"; # long list
      ls="eza -a1   --icons=auto"; # short list
      ll="eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      ld="eza -lhD --icons=auto"; # long list dirs
      lt="eza --icons=auto --tree"; # list folder as tree
      ff="fastfetch --logo nixos_small --logo-color-2 magenta";
      cl="hyprctl clients";



      ga="git add .";
      gl="git log --oneline | fzf";
      gd="git diff HEAD^";
      gs="git status";
      cr="cargo run";



      nr="sudo nixos-rebuild switch --flake /home/meow/nix#nixos && cd ~/nix && git add . && git commit -m $(date +'%d/%m %H:%M:%S')";
      nro="sudo nixos-rebuild switch --offline --flake /home/meow/nix#nixos && cd ~/nix && git add . && git commit -m $(date +'%d/%m %H:%M:%S')";
      na="nvim ~/nix/packages.nix -c '/systemPackages'";
      ns="nix-shell -p";

      n="nvim";
    };

  };
}
