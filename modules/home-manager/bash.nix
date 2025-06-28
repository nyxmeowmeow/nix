{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFile = "/home/meow/.config/.bash_history";
    historyIgnore = [
      "ls"
      "nr"
      "ng"
      "mkdir"
    ];
    sessionVariables = {
      MANPAGER = "nvim +Man!"; # use nvim for man
      SUDO_TIMESTAMP_TIMEOUT = 0;
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "zen";
      NIXOS_OZONE_WL = "1"; # tell things to use wayland
      NIXPKGS_ALLOW_UNFREE = "1";
      FZF_DEFAULT_OPTS = "--color=fg:#cad3f5,hl:#8bd5ca,fg+:#000000,bg+:#b7bdf8,hl+:#8bd5ca,info:#7f8c8d,prompt:#b7bdf8,spinner:-1,pointer:#b7bdf8,gutter:-1,info:#939ab7,border:-1 --border=none --info=hidden --header='' --prompt='󰘧 ' --no-bold -i --pointer=''";
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      hist="history | fzf | read -l command; eval $command";

      sudo = "sudo -k"; # prompt every time
      s = "sudo -k"; # prompt every time
      rm = "rm -i"; # prompt every time
      mv = "mv -i"; # prompt every time
      ln = "ln -i"; # prompt every time

        logout = "hyprctl dispatch exit 0";
# l = "eza -lh  --icons=auto"; # long list
      ls = "eza -a1   --icons=auto"; # short list
# ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
# ld = "eza -lhD --icons=auto"; # long list dirs
# lt = "eza --icons=auto --tree"; # list folder as tree
      ff = "fastfetch --logo nixos_small --logo-color-2 magenta";



      ga = "git add .";
      gcl = "git clone";
      gd = "git diff HEAD^";
      gs = "git status";

      cr = "cargo run";

      meow = "echo :3"; # so silly

      na = "nvim ~/nix/packages.nix -c '/systemPackages'";
      ns = "nix-shell -p";

      n = "nvim";
    };
    initExtra = ''
    source ${pkgs.bash-completion}/etc/bash_completion.d/000_bash_completion_compat.bash
    '';
  };
}
