{ ... }: {
programs.nixvim = {
globals.mapleader = " ";
    keymaps = [
      {
        key = "gh";
        action = "^";
        mode = "n";
      }
      {
        key = "gi";
        action = "$";
        mode = "n";
      }
      {
        key = "<C-S>";
        action = "<cmd>w<cr>";
        mode = "n";
	options.silent = true;
      }
    ];
};

}
