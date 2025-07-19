{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.kanso-nvim ];
     extraConfigLua = ''
-- Default options:
require('kanso').setup({
    bold = true,                 -- enable bold fonts
    italics = false,             -- enable italics
    compile = false,             -- enable compiling the colorscheme
    undercurl = false,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = {},
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { zen = {}, pearl = {}, ink = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "ink",              -- Load "zen" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "ink",           -- try "ink" !
        light = "pearl"         -- try "mist" !
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanso")
       '';
       };
}
