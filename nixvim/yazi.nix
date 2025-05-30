{ ... }: {
programs.nixvim.plugins.yazi = {
enable = true;
keys = [
    {
      key = "<leader>f";
      mode = [ "n" "v" ];
      action = "<cmd>Yazi<cr>";
    }
];


};
}
