{
  programs.nixvim.plugins.lualine = {
    enable = true;

    # starts one row up for a sec when not lazy loaded
    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      icons_enabled = true;
      always_show_tabline = true;

      options = {
        component_separators = "";
        section_separators = "";
        # theme = {
        #   normal = { a = { 
        #     fg = "#3B224C";
        #     bg = "#A4A0E8";
        #   }; 
        #   };
        #   insert = { a = { 
        #     fg = "#3B224C";
        #     bg = "#DBBFEF";
        #   }; 
        #   };
        #   visual = { a = { 
        #     fg = "#3B224C";
        #     bg = "#D678B5";
        #   }; 
        #   };
        #   replace = { a = { 
        #     fg = "#3B224C";
        #     bg = "#D678B5";
        #   }; 
        #   };
        #   inactive = { a = {
        #     fg = "#A4A0E8";
        #     bg = "#00000000";
        #   };
        #   };
        # };
      };
      sections = {
        lualine_a = [

        {
          __unkeyed-1 = "buffers";
          separator = "";
          symbols = {
            modified = " ";
            alternate_file = "";
          };
          max_length = 1000000;

          use_mode_colors = true;
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
