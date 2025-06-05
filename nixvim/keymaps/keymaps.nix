{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [

    { # append semicolon
      key = "<leader>;";
      action = "mzA;`z";
      mode = "n";
    }

    { # insert line below
      key = "<C-k>";
      action = "o<esc>";
      mode = "n";
    }

    { # insert line above
      key = "<C-S-k>";
      action = "O<esc>";
      mode = "n";
    }

    {
      key = "<C-w>";
      action = "<C-v>";
      mode = "n";
    }

    {
      key = "<esc>";
      action = "<cmd>nohlsearch<cr>";
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

    { key = "{"; action = "("; mode = [ "n" "v" "x" ]; }
    { key = "}"; action = ")"; mode = [ "n" "v" "x" ]; }
    { key = "("; action = "{"; mode = [ "n" "v" "x" ]; }
    { key = ")"; action = "}"; mode = [ "n" "v" "x" ]; }

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
