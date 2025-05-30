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

        # LineNrAbove = { fg = colors.surface2 };
        # LineNrBelow = { fg = colors.surface2 };
        # CursorLineNr = { fg = "#DBBFEF" };
        CursorLine = { bg = "#886C9C"; };
        TelescopeSelectionCaret = { fg = "#00000000"; };
        Pmenu = { bg = "#00000000"; };
        PmenuKind = { bg = "#00000000"; };
        PmenuExtra = { bg = "#00000000"; };
        NoiceCmdlinePopup = { bg = "#00000000"; };
        NoiceCmdlinePopupTitleSearch = { fg = "#DBBFEF"; };
        NoicePopup = { bg = "#00000000"; };
        Normal = { bg = "#00000000"; };
        NormalFloat = { bg = "#00000000"; };
        NormalNC = { bg = "#00000000"; };
        StatusLine = { bg = "#00000000"; };
        StatusLineNC = { bg = "#00000000"; };
        NoiceCmdlinePopupBorderHelp = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupTitleHelp = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupTitle = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupBorder = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlineIcon = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupBorderLua = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupBorderCalculator = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupTitleCalculator = { fg = "#DBBFEF"; bg = "#00000000"; };
        NoiceCmdlinePopupBorderSearch = { fg = "#DBBFEF";};
        NoiceCmdlineIconSearch = { fg = "#DBBFEF";};
        TelescopeBorder = { fg = "#DBBFEF"; bg = "#00000000"; };
        TelescopeTitle = { fg = "#DBBFEF"; bg = "#00000000"; };
        SnacksIndentChunk = { fg = "#DBBFEF"; bold = true; };
        SnacksIndentScope = { fg = "#DBBFEF"; bold = true; };
        AlphaShortcut = { fg = "#DBBFEF"; };
        TreesitterContextLineNumber = { bg = "#00000000"; };
        RenderMarkdownCode = { bg = "#3B224C"; };
        RenderMarkdownBullet = { fg = "#A4A0E8"; };
        RenderMarkdownCodeInline = { bg = "#3B224C"; };
        RenderMarkdownInlineHighlight = { fg = "#DBBFEF";};
        RenderMarkdownTableHead = { fg = "#DBBFEF";};
        RenderMarkdownTableRow = { fg = "#DBBFEF";};
        RenderMarkdownTableFill = { fg = "#DBBFEF";};
        #TermCursor = { bg = colors.text };
        #Character = { fg = colors.teal };
        String = { fg = "#A5E07F"; };
        #Constant = { fg = colors.peach };
        #FunctionBuiltIn = { fg = colors.green };
        #Number = { fg = colors.peach };
        #Boolean = { fg = colors.peach };
        #Float = { fg = colors.peach };
        Conditional = { fg = "#D678B5"; };
        # Statement = { fg = "#DBBFEF"; };
        # Repeat = { fg = "#DBBFEF";};
        # Label = { fg = "#DBBFEF";};
        # Keyword = { fg = "#DBBFEF";};
        # Exception = { fg = "#DBBFEF";};
        # Include = { fg = "#DBBFEF";};
        # PreProc = { fg = "#DBBFEF";};
        # Define = { fg = "#DBBFEF";};
        # Macro = { fg = "#DBBFEF";};
        # PreCondit = { fg = "#DBBFEF";};
        # StorageClass = { fg = "#DBBFEF";};
        # Type = { fg = "#DBBFEF";};
        # Structure = { fg = "#DBBFEF";};
        # Typedef = { fg = "#DBBFEF";};
        # Tag = { fg = "#DBBFEF";};
        # Special = { fg = "#DBBFEF";};
        # SpecialChar = { fg = "#DBBFEF";};
        # SpecialComment = { fg = "#DBBFEF";};
        # Debug = { fg = "#DBBFEF";};
        # Ignore = { fg = "#DBBFEF";};
            };
		};
	};
	 }
