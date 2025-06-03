{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.nvim-highlight-colors ];
     extraConfigLua = ''
       require('nvim-highlight-colors').setup()
       '';
       };
       }
#     extraConfigLua = ''
#       require('nvim-highlight-colors').setup({
#
#
#           modes = {
#           ataraxis = {
#           shade = "",
#           backdrop = 0,
#           width = 70,
#           height = 44,
#           },
#           quit_untoggles = true,
#           padding = {
#           left = 0,
#           right = 0,
#           top = 0,
#           bottom = 0,
#           },
#           },
#           minimalist = {
#           ignored_buf_types = { "nofile" },
#           options = {
#             number = false,
#             relativenumber = false,
#             showtabline = 0,
#             signcolumn = "no",
#             statusline = "",
#             cmdheight = 1,
#             laststatus = 0,
#             showcmd = false,
#             showmode = false,
#             ruler = false,
#             numberwidth = 1
#           },
#           },
#           narrow = {
#               folds_style = "invisible",
#             run_ataraxis = true,
#           },
#       },
#       integrations = {
#         lualine = false
#       },
#
#   })
#
# '';
# };
# }
