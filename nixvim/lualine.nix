{ ... }: {
		programs.nixvim.plugins.lualine = {
			enable = true;
			options = {
    icons_enabled = true;

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
			};
		};
		}
