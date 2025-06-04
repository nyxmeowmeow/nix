{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      transparent_background = true;
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
        FlashMatch.fg = "#DBBFEF";
        FlashCurrent.fg = "#D678B5";
        FlashLabel.fg = "#F22C86";
        FlashBackdrop.fg = "#886C9C";

        TelescopeSelection = { fg = "#000000"; bg = "#b7bdf8"; gui = null; };
        TelescopeSelectionCaret.fg = "#b7bdf8";
        TelescopePromptPrefix.fg = "#a5adcb";
        TelescopePromptCounter.fg = "#a5adcb";
        TelescopePrevieHyphen.fg = "#b7bdf8";
        TelescopeResultsDiffUntracked.fg = "#a5adcb";
        MiniIndentscopeSymbol.fg = "#a5adcb";



        MatchParen = { fg = "#F22C86"; bg = "None"; };
        LineNrAbove.fg = "#886C9C";
        LineNrBelow.fg = "#886C9C";
        LineNr.fg = "#b7bdf8";
        CursorLineNr.fg = "#b7bdf8";
        CursorLine.bg = "#181926";
        NoiceCmdlinePopupTitleSearch.fg = "#b7bdf8";
        NoiceCmdlinePopupBorderHelp.fg = "#b7bdf8";
        NoiceCmdlinePopupTitleHelp.fg = "#b7bdf8";
        NoiceCmdlinePopupTitle.fg = "#b7bdf8";
        NoiceCmdlinePopupBorder.fg = "#b7bdf8";
        NoiceCmdlineIcon.fg = "#b7bdf8";
        NoiceCmdlinePopupBorderLua.fg = "#b7bdf8";
        NoiceCmdlinePopupBorderCalculator.fg = "#b7bdf8";
        NoiceCmdlinePopupTitleCalculator.fg = "#b7bdf8";
        NoiceCmdlinePopupBorderSearch.fg = "#b7bdf8";
        NoiceCmdlineIconSearch.fg = "#b7bdf8";
        TelescopeBorder.fg = "#b7bdf8";
        TelescopeTitle.fg = "#b7bdf8";
        SnacksIndentChunk.fg = "#b7bdf8";
        SnacksIndentScope.fg = "#b7bdf8";
        RenderMarkdownCode.bg = "#3B224C";
        RenderMarkdownBullet.fg = "#cad3f5";
        RenderMarkdownCodeInline.bg = "#a5adcb";
        RenderMarkdownInlineHighlight.fg = "#b7bdf8";
        RenderMarkdownTableHead.fg = "#b7bdf8";
        RenderMarkdownTableRow.fg = "#b7bdf8";
        RenderMarkdownTableFill.fg = "#b7bdf8";
#TermCursor.bg = colors.text
        Character.fg = "#cad3f5";
        String.fg = "#a6da95";
        Constant.fg = "#C78DFC";
#FunctionBuiltIn.fg = colors.green
#Number.fg = colors.peach
#Boolean.fg = colors.peach
#Float.fg = colors.peach
        Conditional.fg = "#D678B5";
        Statement.fg = "#b7bdf8";
# Repeat.fg = "#b7bdf8";
# Label.fg = "#b7bdf8";
        Keyword.fg = "#D678B5";
# Exception.fg = "#b7bdf8";
# Include.fg = "#b7bdf8";
# PreProc.fg = "#b7bdf8";
# Define.fg = "#b7bdf8";
        Macro.fg = "#b7bdf8";
# PreCondit.fg = "#b7bdf8";
# StorageClass.fg = "#b7bdf8";
# Type.fg = "#D5E7FF";
# Structure.fg = "#b7bdf8";
# Typedef.fg = "#b7bdf8";
# Tag.fg = "#b7bdf8";
        Comment.fg = "#a5adcb";
        Special.fg = "#b7bdf8";
        SpecialChar.fg = "#b7bdf8";
        SpecialComment.fg = "#a5adcb";
# Debug.fg = "#b7bdf8";
# Ignore.fg = "#b7bdf8";


"@lsp.type.class".fg = "#D5E7FF";
"@lsp.type.comment".fg = "#886C9C";
#"@lsp.type.decorator".fg = "";
"@lsp.type.enum".fg = "#D5E7FF";
"@lsp.type.enumMember".fg = "#cad3f5";
#"@lsp.type.event".fg = "";
"@lsp.type.function".fg = "#D5E7FF";
"@function.builtin".fg = "#b7bdf8";
#"@lsp.type.interface".fg = "";
"@lsp.type.keyword".fg = "#D678B5";
"@lsp.type.macro".fg = "#b7bdf8";
"@constant.macro".fg = "#b7bdf8";
"@lsp.type.method".fg = "#D5E7FF";
"@function.method".fg = "#00FF00";
#"@lsp.type.modifier".fg = "";
#"@type.qualifier".fg = "";
#"@lsp.type.namespace".fg = "";
"@lsp.type.number".fg = "#eed49f";
"@lsp.type.operator".fg = "#b7bdf8";
"@operator".fg = "#b7bdf8";
"Operator".fg = "#b7bdf8";
"Delimiter".fg = "#cad3f5";
#"@lsp.type.parameter".fg = "";
"@paramater".fg = "#cad3f5";
"@property".fg = "#D5E7FF";
"@module".fg = "#b7bdf8";

#"@lsp.type.property".fg = "";
"@lsp.type.regexp".fg = "#FF0000";
"@lsp.type.string".fg = "#A5E07F";
"@lsp.type.struct".fg = "#D5E7FF";
"@lsp.type.type".fg = "#D5E7FF";
#"@lsp.type.typeParameter".fg = "";
"@type.definition".fg = "#FF00FF";
"@lsp.type.variable".fg = "#cad3f5";







      };
    };
  };
}
