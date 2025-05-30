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
				];
				lualine_b = [ "none" ];
				lualine_c = [];
				lualine_x = [];
				lualine_y = [];
				lualine_z = [
					"diagnostics"
				];
			};
		};
	};
	 }
