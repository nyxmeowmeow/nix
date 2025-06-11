{ lib, config, ... }: 
let
  col = import ../../themes/lix/colors.nix;
in {
  config = lib.mkIf (config.theme == "lix") {


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

          FlashCurrent.fg = col.base0B;
          FlashLabel.fg = "#F22C86";
          TelescopeSelection = { fg = col.base00; bg = "#DBBFEF"; };
          TelescopeSelectionCaret.fg = col.base00;
          TelescopePromptPrefix.fg = col.base00;
          TelescopePromptCounter.fg = col.base00;
          TelescopePrevieHyphen.fg = col.base00;
          MatchParen = { fg = "#F22C86"; bg = "none"; };
          CursorLine.bg = "#47345E";
          RenderMarkdownBullet.fg = col.base01;
          RenderMarkdownCodeInline.bg = col.base00;
#TermCursor.bg = col.text
          Character.fg = col.base01;
          String.fg = "#A5E07F";
          Constant.fg = "#C78DFC";
#FunctionBuiltIn.fg = col.green
#Number.fg = col.peach
#Boolean.fg = col.peach
#Float.fg = col.peach
          Conditional.fg = col.base0B;
# Repeat.fg = col.base08;
# Label.fg = col.base08;
          Keyword.fg = col.base0B;
# Exception.fg = col.base08;
# Include.fg = col.base08;
# PreProc.fg = col.base08;
# Define.fg = col.base08;
# PreCondit.fg = col.base08;
# StorageClass.fg = col.base08;
# Type.fg = "#D5E7FF";
# Structure.fg = col.base08;
# Typedef.fg = col.base08;
# Tag.fg = col.base08;
# Debug.fg = col.base08;
# Ignore.fg = col.base08;
          "@lsp.type.class".fg = "#D5E7FF";
#"@lsp.type.decorator".fg = "";
          "@lsp.type.enum".fg = "#D5E7FF";
          "@lsp.type.enumMember".fg = col.base01;
#"@lsp.type.event".fg = "";
          "@lsp.type.function".fg = "#D5E7FF";
#"@lsp.type.interface".fg = "";
          "@lsp.type.keyword".fg = col.base0B;
          "@lsp.type.method".fg = "#D5E7FF";
#"@lsp.type.modifier".fg = "";
#"@type.qualifier".fg = "";
#"@lsp.type.namespace".fg = "";
          "@lsp.type.number".fg = col.base09;
          Number.fg = col.base09;
          "Delimiter".fg = col.base01;
#"@lsp.type.parameter".fg = "";
          "@parameter".fg = col.base0A;
          "@property".fg = "#D5E7FF";
#"@lsp.type.property".fg = "";
          "@lsp.type.string".fg = "#A5E07F";
          "@lsp.type.struct".fg = "#D5E7FF";
          "@lsp.type.type".fg = "#D5E7FF";
#"@lsp.type.typeParameter".fg = "";
          "@lsp.type.variable".fg = col.base01;


          FlashMatch.fg = col.base08;
          LineNr.fg = col.base08;
          CursorLineNr.fg = col.base08;
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
          RenderMarkdownCode.bg = col.base00;
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
          FlashBackdrop.fg = col.base07;
          TelescopeResultsDiffUntracked.fg = col.base07;
          MiniIndentscopeSymbol.fg = col.base07;
          LineNrAbove.fg = col.base07;
          LineNrBelow.fg = col.base07;
          Comment.fg = col.base07;
          SpecialComment.fg = col.base07;
          "@lsp.type.comment".fg = col.base07;

          PreProc.fg = col.base01;
          rustFoldBraces.fg = col.base01;
          cBlock.fg = col.base01;
          cParen.fg = col.base01;
          cBracket.fg = col.base01;
          "@lsp.mod.paramater.c".fg = col.base0A;
          "@lsp.type.paramater.c".fg = col.base0A;

          Identifier.fg = col.base01;


          Type.fg = col.base0E;
          Structure.fg = col.base0E;
          rustStructure.fg = col.base0E;
          "@lsp.type.class.c".fg = col.base0A; # typedef
            "@type.builtin".fg = col.base0E;


          StorageClass.fg = col.base08;


        };
      };
    };
  };
}
