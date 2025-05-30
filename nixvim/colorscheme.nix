{ ... }: {
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

#lilac = "#C7B8E0";
#green = "#A5E07F"; #a6da95
#white = "#d5e7ff";
#orange = "#EFBA5D";
#bubblegum = "#D678B5";
#magenta = "#C78DFC";
#red = "#F22C86";
#violet = "#6F44F0";
#pink = "#DBBFEF";
			};
		};
	};
	 }
