{
  pkgs,
  ...
}: {
# doesnt work the nix way?
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.mini-surround ];
     extraConfigLua = ''
       require('mini.surround').setup()
       '';
       };
       }
