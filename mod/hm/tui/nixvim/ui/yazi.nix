{
  rounding,
  ...
}:
let
  rounding = if ((import ../../../../os/config.nix).config.rounding) then "rounded" else "single";
in
{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;

      lazyLoad.enable = true;
      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];

      settings = {
        yazi_floating_window_border = rounding;
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
