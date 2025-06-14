{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [

    { # append semicolon
      key = "<leader>;";
      action = "mzA;<esc>`z";
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
      key = "<C-r>";
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
      key = "e";
      action = "ge";
      mode = "n";
    }

    {
      key = "a";
      action = "ga";
      mode = "n";
    }

    {
      key = "ga";
      action = "^";
      mode = "n";
    }

    {
      key = "ge";
      action = "$";
      mode = "n";
    }

    { key = "{"; action = "("; mode = [ "n" "v" "x" ]; }
    { key = "}"; action = ")"; mode = [ "n" "v" "x" ]; }
    { key = "("; action = "{"; mode = [ "n" "v" "x" ]; }
    { key = ")"; action = "}"; mode = [ "n" "v" "x" ]; }

    {
      key = "<C-b>";
      action = "<C-o>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<C-w>";
      action = "<C-i>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<tab>";
      action = "%";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<C-r>";
      action = "<C-v>";
      mode = "n" ;
    }

    {
      key = "U";
      action = "<C-r>";
      mode = ["n" "v" "x" ];
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
      key = "<leader>d";
      action = "<cmd>bp<cr>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<leader>c";
      action = "<cmd>bn<cr>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<leader>a";
      action = "<C-6>";
      mode = "n";
    }

    ];
  };

}
