{ pkgs, ... }: {
    programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = false;

    lazyLoad.settings.event = [
      "BufRead"
    ];

    # grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    #   bash
    #   json
    #   lua
    #   make
    #   markdown
    #   nix
    #   regex
    #   toml
    #   xml
    #   yaml
    #   c
    #   cpp
    #   haskell
    #   go
    #   rust
    #   python
    # ];

    settings = {
      textobject.enable = true;
      incremental_selection.enable = true;
      # indent.enable = true;
    };
  };
}
