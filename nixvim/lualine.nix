{ ... }: {
	programs.nixvim.plugins.lualine = {
		enable = true;


    #lazyLoad.settings.event = [
    #  "VimEnter"
    #  "BufReadPost"
    #  "BufNewFile"
    #];


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
				left = " ";
				right = " ";
			};
			section_separators = {
				left = " ";
				right = " ";
			};

			sections = {
				lualine_a = [
			
					{
						__unkeyed-1 = "buffers";
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
				lualine_b = [ "none" ];
				lualine_c = [ "none" ];
				lualine_x = [ "none" ];
				lualine_y = [ "none" ];
				lualine_z = [
					{
						__unkeyed-1 = "diagnostics";
						sources = [ "nvim_diagnostic" "coc" ];
						sections = [ "error" ];


						diagnostics_color = {
							error = "DiagnosticError";
							warn = "DiagnosticWarn";
							info = "DiagnosticInfo";
							hint = "DiagnosticHint";
						};
						symbols = { error = ""; warn = ""; info = ""; hint = ""; };
						colored = true;
						update_in_insert = false;
						always_visible = false;





					}
				];
			};
		};
	};
	 }
