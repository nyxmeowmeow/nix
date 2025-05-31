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

      };
      no_italic = false;
      no_bold = false;
      no_underline = false;


      color_overrides.all = {
        text = "#A4A0E8";
        base = "#3B224C";

        mauve = "#C7B8E0";
        green = "#A5E07F"; #a6da95
          white = "#d5e7ff";
        peach = "#EFBA5D";
        maroon = "#D678B5";
        magenta = "#C78DFC";
        red = "#F22C86";
        lavender = "#6F44F0";
        pink = "#DBBFEF";
      };
      highlight_overrides.all = {
        MatchParen = { fg = "#F22C86"; bg = "None"; };
        LineNrAbove.fg = "#886C9C";
        LineNrBelow.fg = "#886C9C";
        LineNr.fg = "#DBBFEF";
        CursorLineNr.fg = "#DBBFEF";
        CursorLine.bg = "#47345E";
        NoiceCmdlinePopupTitleSearch.fg = "#DBBFEF";
        NoiceCmdlinePopupBorderHelp.fg = "#DBBFEF";
        NoiceCmdlinePopupTitleHelp.fg = "#DBBFEF";
        NoiceCmdlinePopupTitle.fg = "#DBBFEF";
        NoiceCmdlinePopupBorder.fg = "#DBBFEF";
        NoiceCmdlineIcon.fg = "#DBBFEF";
        NoiceCmdlinePopupBorderLua.fg = "#DBBFEF";
        NoiceCmdlinePopupBorderCalculator.fg = "#DBBFEF";
        NoiceCmdlinePopupTitleCalculator.fg = "#DBBFEF";
        NoiceCmdlinePopupBorderSearch.fg = "#DBBFEF";
        NoiceCmdlineIconSearch.fg = "#DBBFEF";
        TelescopeBorder.fg = "#DBBFEF";
        TelescopeTitle.fg = "#DBBFEF";
        SnacksIndentChunk.fg = "#DBBFEF";
        SnacksIndentScope.fg = "#DBBFEF";
        RenderMarkdownCode.bg = "#3B224C";
        RenderMarkdownBullet.fg = "#A4A0E8";
        RenderMarkdownCodeInline.bg = "#3B224C";
        RenderMarkdownInlineHighlight.fg = "#DBBFEF";
        RenderMarkdownTableHead.fg = "#DBBFEF";
        RenderMarkdownTableRow.fg = "#DBBFEF";
        RenderMarkdownTableFill.fg = "#DBBFEF";
#TermCursor.bg = colors.text
        Character.fg = "#A4A0E8";
        String.fg = "#A5E07F";
        Constant.fg = "#C78DFC";
#FunctionBuiltIn.fg = colors.green
#Number.fg = colors.peach
#Boolean.fg = colors.peach
#Float.fg = colors.peach
        Conditional.fg = "#D678B5";
        Statement.fg = "#DBBFEF";
# Repeat.fg = "#DBBFEF";
# Label.fg = "#DBBFEF";
        Keyword.fg = "#D678B5";
# Exception.fg = "#DBBFEF";
# Include.fg = "#DBBFEF";
# PreProc.fg = "#DBBFEF";
# Define.fg = "#DBBFEF";
        Macro.fg = "#DBBFEF";
# PreCondit.fg = "#DBBFEF";
# StorageClass.fg = "#DBBFEF";
# Type.fg = "#D5E7FF";
# Structure.fg = "#DBBFEF";
# Typedef.fg = "#DBBFEF";
# Tag.fg = "#DBBFEF";
        Comment.fg = "#886C9C";
        Special.fg = "#DBBFEF";
        SpecialChar.fg = "#FF0000";
        SpecialComment.fg = "#886C9C";
# Debug.fg = "#DBBFEF";
# Ignore.fg = "#DBBFEF";

        TSComment.fg = "#886C9C";
        TSConstan.bg = "#FF0000";
        TSConstBuilti.bg = "#FF0000";
        TSConstMacr.bg = "#FF0000";
        TSConstructo.bg = "#FF0000";
        TSErro.bg = "#FF0000";
        TSExceptio.bg = "#FF0000";
        TSFiel.bg = "#FF0000";
        TSFunctio.bg = "#FF0000";
        TSFuncBuilti.bg = "#FF0000";
        TSFuncMacr.bg = "#FF0000";
        TSInclud.bg = "#FF0000";
        TSKeywor.bg = "#FF0000";
        TSLabe.bg = "#FF0000";
        TSMetho.bg = "#FF0000";
        TSNamespac.bg = "#FF0000";
        TSOperator.fg = "#DBBFEF";
#        TSParameter 
#        TSProperty 
        TSPunctDelimiter.fg = "#00FF00";
        TSPunctBracket.fg = "#A4A0E8";
        TSPunctSpecial.fg = "#FF0000";
#        TSTag 
        TSText.fg = "#A4A0E8";
        TSType.fg = "#D5E7FF";
#        TSVariable 
#        TSVariableBuiltin 








      };
    };
  };
}
