{ pkgs, ... }: {
    programs.nixvim.plugins.treesitter = {
    enable = true;
    # ensureInstalled = [ "c" "cpp" "haskell" "go" "rust" "python" ];
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      nix
      regex
      toml
      xml
      yaml
      c
      cpp
      haskell
      go
      rust
      python
    ];

    #lazyLoad.settings.event = [
    #  "BufRead"
    #];
    };
}
