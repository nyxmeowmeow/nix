{
  rounding,
  ...
}: {
  programs.nixvim = {
    plugins.yazi = {
      enable = true;

      lazyLoad.enable = true;
      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];

      settings = {
        yazi_floating_window_border = 
          if rounding then "rounded" else "single";

        highlight_hovered_buffers_in_same_directory = false;
      };
    };

    keymaps = [
    {
      key = "<leader>y";
      mode = [ "n" "v" ];
      action = "<cmd>Yazi<cr>";
    }
    ];
  };
}
