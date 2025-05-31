{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    {
      key = "<esc>";
      action = "<cmd>nohlsearch<R>";
      mode = "n";
    }
    {
      key = "<backspace>";
      action = "\"_x";
      mode = "n";
    }
    {
      key = "<C-backspace>";
      action = "<C-w>";
      mode = [ "i" "c" "t" ];
    }
    {
      key = "gh";
      action = "^";
      mode = "n";
    }
    {
      key = "gl";
      action = "$";
      mode = "n";
    }
    {
      key = "H";
      action = "<C-o>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "L";
      action = "<C-i>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<tab>";
      action = "%";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<C-f>";
      action = "<C-v>";
      mode = "n" ;
    }
    {
      key = "U";
      action = "<C-r>";
      mode = ["n" "v" "x" ];
    }
    {
      key = "<C-c>";
      action = "e";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<C-a>";
      action = "<C-d>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<C-e>";
      action = "<C-u>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<C-S>";
      action = "<cmd>w<cr>";
      mode = [ "i" "n" "v" "x" ];
      options.silent = true;
    }
    {
      key = "<leader>h";
      action = "<cmd>bp<cr>";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<leader>a";
      action = "<C-6>";
      mode = "n";
    }
    {
      key = "<leader>l";
      action = "<cmd>bn<cr>";
      mode = [ "n" "v" "x" ];
    }
    ];
  };

}
