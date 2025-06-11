{ lib, config, ... }: 
let
colors = import ../../themes/lix/colors.nix;
in {
  config = lib.mkIf (config.theme == "macchiato") {

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
          mini = {
            enable = true;
            indentscope_color = "#a5adcb";
          };

        };
        no_italic = true;
        no_bold = true;
        no_underline = true;

        highlight_overrides.all = {
          FlashMatch.fg = colors.base0F;
          FlashLabel.fg = "#F22C86";
          FlashBackdrop.fg = "#886C9C";
          TelescopeSelection = {
            fg = "none";
            bg = colors.base08;
          };
          CursorLine.bg = "#47345E";
          RenderMarkdownCode.bg = "#3B224C";
          RenderMarkdownBullet.fg = colors.base01;
          RenderMarkdownCodeInline.bg = "#3B224C";
          #TermCursor.bg = colors.text
          Character.fg = colors.base01;
          Constant.fg = "#C78DFC";
          #FunctionBuiltIn.fg = colors.green
          #Number.fg = colors.peach
          #Boolean.fg = colors.peach
          #Float.fg = colors.peach
          # Repeat.fg = colors.base08";
          # Type.fg = "#D5E7FF";
          "@lsp.type.class".fg = "#D5E7FF";
          "@lsp.type.comment".fg = colors.base07;
          "@lsp.type.enum".fg = "#D5E7FF";
          "@lsp.type.enumMember".fg = colors.base01;
          "@lsp.type.function".fg = "#D5E7FF";
          "@lsp.type.method".fg = "#D5E7FF";
          "@lsp.type.number".fg = "#EFBA5D";
          "Delimiter".fg = colors.base01;
          "@paramater".fg = colors.base01;
          "@property".fg = "#D5E7FF";
          #"@lsp.type.property".fg = "";
          "@lsp.type.string".fg = "#A5E07F";
          "@lsp.type.struct".fg = "#D5E7FF";
          "@lsp.type.type".fg = "#D5E7FF";
          #"@lsp.type.typeParameter".fg = "";
          "@lsp.type.variable".fg = colors.base01;


          MatchParen = { fg = colors.base0C; bg = "None"; };
          Conditional.fg = colors.base0A;
          Keyword.fg = colors.base0A;
          "@lsp.type.keyword".fg = colors.base0A;
          FlashCurrent.fg = colors.base0A;
          CursorLineNr.fg = colors.base08;
          NoiceCmdlinePopupTitleSearch.fg = colors.base08;
          NoiceCmdlinePopupBorderHelp.fg = colors.base08;
          NoiceCmdlinePopupTitleHelp.fg = colors.base08;
          NoiceCmdlinePopupTitle.fg = colors.base08;
          NoiceCmdlinePopupBorder.fg = colors.base08;
          NoiceCmdlineIcon.fg = colors.base08;
          NoiceCmdlinePopupBorderLua.fg = colors.base08;
          NoiceCmdlinePopupBorderCalculator.fg = colors.base08;
          NoiceCmdlinePopupTitleCalculator.fg = colors.base08;
          NoiceCmdlinePopupBorderSearch.fg = colors.base08;
          NoiceCmdlineIconSearch.fg = colors.base08;
          TelescopeBorder.fg = colors.base08;
          TelescopeTitle.fg = colors.base08;
          SnacksIndentChunk.fg = colors.base08;
          SnacksIndentScope.fg = colors.base08;
          RenderMarkdownInlineHighlight.fg = colors.base08;
          RenderMarkdownTableHead.fg = colors.base08;
          RenderMarkdownTableRow.fg = colors.base08;
          RenderMarkdownTableFill.fg = colors.base08;
          Statement.fg = colors.base08;
          Macro.fg = colors.base08;
          Special.fg = colors.base08;
          SpecialChar.fg = colors.base08;
          "@function.builtin".fg = colors.base08;
          "@lsp.type.macro".fg = colors.base08;
          "@constant.macro".fg = colors.base08;
          "@lsp.type.operator".fg = colors.base08;
          "@operator".fg = colors.base08;
          "Operator".fg = colors.base08;
          "@module".fg = colors.base08;
          TelescopeResultsDiffUntracked.fg = colors.base07;
          MiniIndentscopeSymbol.fg = colors.base07;
          LineNrAbove.fg = colors.base07;
          LineNrBelow.fg = colors.base07;
          Comment.fg = colors.base07;
          SpecialComment.fg = colors.base07;
          String.fg = colors.base0F;
        };
      };
    };
  };
}
