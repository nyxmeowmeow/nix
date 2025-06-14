{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;

      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];

      settings = {

        yazi_floating_window_border = "round";
        highlight_hovered_buffers_in_same_directory = false;
      };
    };





    keymaps = [
    {
      key = "<leader>e";
      mode = [ "n" "v" ];
      action = "<cmd>Yazi<cr>";
    }
    ];
  };

}
