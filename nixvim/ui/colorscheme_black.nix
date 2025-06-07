{ config, ... }:
let
  colors = import ./../../themes/${config.theme}/colors.nix { };
in
{
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
        CursorLine.bg = "#47345E";
        NoiceCmdlinePopupTitleSearch.fg = "#b7bdf8";
        NoiceCmdlinePopupBorderHelp.fg = "#b7bdf8";
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
        SpecialChar.fg = "#DBBFEF";
        SpecialComment.fg = "#886C9C";
# Debug.fg = "#DBBFEF";
# Ignore.fg = "#DBBFEF";


"@lsp.type.class".fg = "#D5E7FF";
"@lsp.type.comment".fg = "#886C9C";
#"@lsp.type.decorator".fg = "";
"@lsp.type.enum".fg = "#D5E7FF";
"@lsp.type.enumMember".fg = "#A4A0E8";
#"@lsp.type.event".fg = "";
"@lsp.type.function".fg = "#D5E7FF";
"@function.builtin".fg = "#DBBFEF";
#"@lsp.type.interface".fg = "";
"@lsp.type.keyword".fg = "#D678B5";
"@lsp.type.macro".fg = "#DBBFEF";
"@constant.macro".fg = "#DBBFEF";
"@lsp.type.method".fg = "#D5E7FF";
"@function.method".fg = "#00FF00";
#"@lsp.type.modifier".fg = "";
#"@type.qualifier".fg = "";
#"@lsp.type.namespace".fg = "";
"@lsp.type.number".fg = "#EFBA5D";
"@lsp.type.operator".fg = "#DBBFEF";
"@operator".fg = "#DBBFEF";
"Operator".fg = "#DBBFEF";
"Delimiter".fg = "#A4A0E8";
#"@lsp.type.parameter".fg = "";
"@paramater".fg = "#A4A0E8";
"@property".fg = "#D5E7FF";
"@module".fg = "#DBBFEF";

#"@lsp.type.property".fg = "";
"@lsp.type.regexp".fg = "#FF0000";
"@lsp.type.string".fg = "#A5E07F";
"@lsp.type.struct".fg = "#D5E7FF";
"@lsp.type.type".fg = "#D5E7FF";
#"@lsp.type.typeParameter".fg = "";
"@type.definition".fg = "#FF00FF";
"@lsp.type.variable".fg = "#A4A0E8";







      };
    };
  };
}
