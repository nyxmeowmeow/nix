{ lib, theme, ... }:
let
col = import ../../../../../themes/black/colors.nix;
in {
  config = lib.mkIf (theme == "black") {

    programs.nixvim.colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
        transparent_background = true;
        show_end_of_buffer = false;
        integrations = {
          treesitter = true;
          gitsigns = true;
          noice = true;
          lualine = false;
          mini = {
            enable = true;
            indentscope_color = "#a5adcb";
          };

        };
        no_italic = true;
        no_bold = true;
        no_underline = true;

        highlight_overrides.all = {
          TinyInlineDiagnosticVirtualTextArrow = { fg = "None"; bg = "None"; };

          lualine_a_normal = { fg = col.base; bg = col.lavender; };
          lualine_a_insert = { fg = col.base; bg = col.mauve; };
          lualine_a_visual = { fg = col.base; bg = col.mauve; };
          lualine_a_replace = { fg = col.base; bg = col.red; };
          lualine_a_command = { fg = col.base; bg = col.lavender; };
          lualine_a_terminal = { fg = col.base; bg = col.lavender; };


          lualine_a_buffers_active_terminal = { fg = col.base; bg = col.lavender; };
          lualine_a_buffers_active_inactive = { fg = col.base; bg = col.lavender; };
          lualine_a_buffers_active_visual = { fg = col.base; bg = col.lavender; };
          lualine_a_buffers_active_normal = { fg = col.base; bg = col.lavender; };

          YaziFloatBorder.fg = col.lavender;

          FlashMatch.fg = col.green;
          FlashLabel.fg = col.red;
          FlashBackdrop.fg = col.surface1;
          TelescopeSelection = {
            fg = col.base;
            bg = col.lavender;
          };
          RenderMarkdownCode.bg = "#3B224C";
          RenderMarkdownBullet.fg = col.base01;
          RenderMarkdownCodeInline.bg = "#3B224C";
          #TermCursor.bg = col.text
          Character.fg = col.text;
          Delimiter.fg = col.text;
          Constant.fg = "#C78DFC";
          #FunctionBuiltIn.fg = col.green
          #Number.fg = col.peach
          #Boolean.fg = col.peach
          #Float.fg = col.peach
          # Repeat.fg = col.base08";
          # Type.fg = "#D5E7FF";
          # "@lsp.type.class".fg = "#D5E7FF";
          # "@lsp.type.comment".fg = col.base07;
          # "@lsp.type.enum".fg = "#D5E7FF";
          # "@lsp.type.enumMember".fg = col.base01;
          # "@lsp.type.function".fg = "#D5E7FF";
          # "@lsp.type.method".fg = "#D5E7FF";
          # "@lsp.type.number".fg = "#EFBA5D";
          # "Delimiter".fg = col.base01;
          # "@paramater".fg = col.base01;
          # "@property".fg = "#D5E7FF";
          # #"@lsp.type.property".fg = "";
          # "@lsp.type.string".fg = "#A5E07F";
          # "@lsp.type.struct".fg = "#D5E7FF";
          # "@lsp.type.type".fg = "#D5E7FF";
          # #"@lsp.type.typeParameter".fg = "";
          # "@lsp.type.variable".fg = col.base01;
          "@punctuation.bracket".fg = col.text;


          MatchParen = { fg = col.red; bg = col.mantle; };
          Conditional.fg = col.mauve;
          Keyword.fg = col.mauve;
          "@lsp.type.keyword".fg = col.mauve;
          FlashCurrent.fg = col.mauve;

          CursorLineNr.fg = col.lavender;
          LineNr.fg = col.lavender;
          LineNrAbove.fg = col.surface1;
          LineNrBelow.fg = col.surface1;

          NoiceCmdlinePopupTitleSearch.fg = col.base08;
          NoiceCmdlinePopupBorderHelp.fg = col.base08;
          NoiceCmdlinePopupTitleHelp.fg = col.base08;
          NoiceCmdlinePopupTitle.fg = col.base08;
          NoiceCmdlinePopupBorder.fg = col.base08;
          NoiceCmdlineIcon.fg = col.base08;
          NoiceCmdlinePopupBorderLua.fg = col.base08;
          NoiceCmdlinePopupBorderCalculator.fg = col.base08;
          NoiceCmdlinePopupTitleCalculator.fg = col.base08;
          NoiceCmdlinePopupBorderSearch.fg = col.base08;
          NoiceCmdlineIconSearch.fg = col.base08;
          TelescopeBorder.fg = col.base08;
          TelescopeTitle.fg = col.base08;
          SnacksIndentChunk.fg = col.base08;
          SnacksIndentScope.fg = col.base08;
          RenderMarkdownInlineHighlight.fg = col.base08;
          RenderMarkdownTableHead.fg = col.base08;
          RenderMarkdownTableRow.fg = col.base08;
          RenderMarkdownTableFill.fg = col.base08;
          Statement.fg = col.base08;
          Macro.fg = col.base08;
          Special.fg = col.base08;
          SpecialChar.fg = col.base08;
          "@function.builtin".fg = col.base08;
          "@lsp.type.macro".fg = col.base08;
          "@constant.macro".fg = col.base08;
          "@lsp.type.operator".fg = col.base08;
          "@operator".fg = col.base08;
          "Operator".fg = col.base08;
          "@module".fg = col.base08;
          TelescopeResultsDiffUntracked.fg = col.base07;
          MiniIndentscopeSymbol.fg = col.base07;
          Comment.fg = col.overlay;
          SpecialComment.fg = col.overlay;
          String.fg = col.green;
        };
      };
    };
  };
}
