{
programs.bash = {
enable = true;
enableCompletion = true;
historyFile = "~/.config";
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
      # TODO move this to themes/*
      # FZF_DEFAULT_OPTS = "--color=fg:#A4A0E8,hl:#DBBFEF,fg+:#A4A0E8,bg+:#5A3D6E,hl+:#DBBFEF,info:#886C9C,prompt:#DBBFEF,spinner:-1,pointer:-1,gutter:#3B224C,info:#886C9C,border:#3B224C";
      NIXOS_OZONE_WL = "1"; # tell things to use wayland
      NIXPKGS_ALLOW_UNFREE = "1";
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
      # gl = "git log --oneline | lines | fzf";
      gcl = "git clone";
      gd = "git diff HEAD^";
      gs = "git status";

      cr = "cargo run";

      meow = "echo :3"; # so silly

      # nr = ''
      #   do {
      #     sudo nixos-rebuild switch --flake /home/meow/nix#nixos
      #     cd ~/nix
      #     git add .
      #     git commit -m $"(date now | format date '%d/%m %H:%M:%S')"
      #   }
      # '';
      na = "nvim ~/nix/packages.nix -c '/systemPackages'";
      ns = "nix-shell -p";

      n = "nvim";
    };
};
}
