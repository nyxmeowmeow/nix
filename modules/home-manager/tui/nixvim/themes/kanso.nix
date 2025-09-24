{ pkgs, lib, theme, ... }: {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

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
            transparent = true,         -- do not set background color
            dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            colors = {                   -- add/modify theme and palette colors
            palette = {},
            theme = { zen = {}, pearl = {}, ink = {}, all = {} },
            },
            overrides = function(colors)
            return {
            -- Assign a static color to strings
            CursorLineNr = { fg = "#7FB4CA" },
            CursorLine = { bg = "NONE" },
            LineNrBelow = { fg = "#393B44" },
            LineNrAbove = { fg = "#393B44" },
            }
            end,
            theme = ${lib.strings.removePrefix "kanso_" theme},              -- Load "zen" theme
              -- background = {               -- map the value of 'background' option to a theme
                --     dark = "ink",           -- try "ink" !
                  --     light = "pearl"         -- try "mist" !
                  -- },
        })

      -- setup must be called before loading
        vim.cmd("colorscheme kanso")
        '';
      };
    };
  }
