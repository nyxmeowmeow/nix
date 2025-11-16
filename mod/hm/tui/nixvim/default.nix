{
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./theme/everforest/hard/hard.nix
    ./theme/everforest/medium/medium.nix
    ./theme/everforest/soft/soft.nix
    ./theme/everforest/soft/lualine.nix
    ./theme/everforest/medium/medium.nix
    ./theme/everforest/medium/lualine.nix
    ./theme/everforest/hard/hard.nix
    ./theme/everforest/hard/lualine.nix
    ./theme/blacchiato.nix
    ./theme/lix/lix.nix
    # ./theme/lix/smear-cursor_lix.nix
    ./theme/macchiato.nix
    ./theme/kanso.nix

    # ./util/picker.nix
    # ./util/firenvim.nix
    ./key/keymaps.nix
    ./key/langmap.nix
    ./key/no_yank_del.nix
    ./lazy.nix
    ./autocommands.nix
    ./misc.nix
    ./nixvim.nix
    ./options.nix
    ./ui/colorizer.nix
    ./ui/lualine.nix
    ./ui/noice.nix
    ./ui/zen-mode.nix
    ./util/bracketed.nix
    ./util/completion.nix
    ./ui/diagnostic.nix
    ./util/flash.nix
    ./ui/indentscope.nix
    ./ui/yank_highlight.nix
    ./util/lsp.nix
    ./util/hardtime.nix
    ./util/neotest.nix
    ./util/lspconfig.nix
    # ./util/pairs.nix
    ./util/splitjoin.nix
    ./util/matchup.nix
    ./util/surround.nix
    ./util/telescope.nix
    ./util/treesitter-textobjects.nix
    ./util/treesitter-context.nix
    ./util/treesitter.nix
    ./ui/yazi.nix
    # ./ui/tiny-glimmer.nix
    ./ui/render-markdown.nix
    # ./ui/smear-cursor.nix
    ./util/luasnip.nix
  ];
}
