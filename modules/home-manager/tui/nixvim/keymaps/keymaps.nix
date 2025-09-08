{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [

    {
      key = "<pgdn>";
      action = "<C-d>";
      mode = [ "n" "i" "x" ];
    }

    {
      key = "<pgup>";
      action = "<C-u>";
      mode = [ "n" "i" "x" ];
    }

    {
      key = "dc";
      action = "dd";
      mode = "n";
    }

    { # avoid sfb for cc
      key = "cd";
      action = "cc";
      mode = "n";
    }

    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      mode = [ "n" "v" "x" ];
      # lua = true;
    }

    {
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
      mode = [ "n" "v" "x" ];
      # lua = true;
    }

    # { # write & quit
    #   key = "Zz";
    #   action = "ZZ";
    #   mode = [ "n" "v" "x" ];
    # }

    { # write & quit
      key = "ZZ";
      action = ":echo \"use :x\"<cr>";
      mode = [ "n" "v" "x" ];
    }

    { # put cursor at top of screen
      key = "zK";
      action = "z<cr>";
      mode = [ "n" "v" "x" ];
    }

    { # put cursor at bottom of screen
      key = "zJ";
      action = "z-";
      mode = [ "n" "v" "x" ];
    }

    { # put top of screen at cursor
      key = "zj";
      action = "zt";
      mode = [ "n" "v" "x" ];
    }

    { # put bottom of screen at cursor
      key = "zk";
      action = "zb";
      mode = [ "n" "v" "x" ];
    }

    { # append semicolon
      key = "<leader>;";
      action = "mzA;<esc>`z";
      mode = [ "n" "v" "x" ];
    }

    { # append comma
      key = "<leader>,";
      action = "mzA,<esc>`z";
      mode = [ "n" "v" "x" ];
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
      key = "<c-s-k>";
      action = "gk";
      mode = "n";
    }

    {
      key = "<c-s-j>";
      action = "gj";
      mode = "n";
    }

    {
      key = "<C-h>";
      action = "d";
      mode = [ "n" "v" "x" "o" ];
    }

    {
      key = "gj";
      action = "^";
      mode = "n";
    }

    {
      key = "gk";
      action = "$";
      mode = "n";
    }

    {
      key = "gJ";
      action = "gj";
      mode = "n";
    }

    {
      key = "gK";
      action = "gk";
      mode = "n";
    }

    { key = "{"; action = "("; mode = [ "n" "v" "x" ]; }
    { key = "}"; action = ")"; mode = [ "n" "v" "x" ]; }
    { key = "("; action = "{"; mode = [ "n" "v" "x" ]; }
    { key = ")"; action = "}"; mode = [ "n" "v" "x" ]; }

    {
      key = "<C-t>";
      action = "<C-o>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<C-c>";
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

    # { key = "<left>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<down>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<up>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<right>"; action = ""; mode = [ "i" "n" "v" "x" ]; }


    ];
  };
}
