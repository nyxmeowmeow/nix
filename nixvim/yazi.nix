{
programs.nixvim = {
plugins.yazi = {
enable = true;
settings = {

yazi_floating_window_border = "none";
highlight_hovered_buffers_in_same_directory = false;
};
};





	keymaps = [
    {
      key = "<leader>f";
      mode = [ "n" "v" ];
      action = "<cmd>Yazi<cr>";
    }
    ];
    };

}
