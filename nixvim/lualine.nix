{ ... }: {
	programs.nixvim.plugins.lualine = {
		enable = true;
		settings = {
			icons_enabled = true;
		always_show_tabline = true;

			theme = {
				normal = { c = { 
					fg = "#A4A0E8";
					bg = "#00000000";
				}; 
				};
				inactive = { c = {
					fg = "#A4A0E8";
					bg = "#00000000";
				};
				};
			};

			component_separators = {
				left = "";
				right = "";
			};
			section_separators = {
				left = "";
				right = "";
			};

			sections = {
				lualine_a = [
					"buffers"
					{
						buffers_color = {
							active = {
								bg = "#A4A0E8";
								fg = "#3B224C";
							};
							inactive = {
								bg = "#00000000";
								fg = "#A4A0E8";
							};
						};
						symbols = {
							modified = " ";
							alternate_file = "";
						};
					}
				];
			};
		};
	};
	 }
