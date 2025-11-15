{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    { # toggle wrap
      key = "<Leader>be"; # tw
      action = "<cmd>lua vim.o.wrap = not vim.o.wrap<cr>";
      mode = [ "n" "x" ];
    }
    { # toggle wrap for buffer
      key = "<Leader>bE"; # tw
      action = "<cmd>lua vim.bo.wrap = not vim.bo.wrap<cr>";
      mode = [ "n" "x" ];
    }
    { # toggle breakindent
      key = "<Leader>br"; # tw
      action = "<cmd>lua vim.o.breakindent = not vim.o.breakindent<cr>";
      mode = [ "n" "x" ];
    }
    { # toggle breakindent for buffer
      key = "<Leader>bR"; # tw
      action = "<cmd>lua vim.bo.breakindent = not vim.bo.breakindent<cr>";
      mode = [ "n" "x" ];
    }


    { # toggle rnu
      key = "<Leader>bv"; # tr
      action = "<cmd>lua vim.o.relativenumber = not vim.o.relativenumber<cr>";
      mode = [ "n" "x" ];
    }
    { # toggle rnu for buffer
      key = "<Leader>bV"; # tr
      action = "<cmd>lua vim.bo.relativenumber = not vim.bo.relativenumber<cr>";
      mode = [ "n" "x" ];
    }

    { # toggle num
      key = "<Leader>bi"; # tn
      action = "<cmd>lua vim.o.number = not vim.o.number<cr>";
      mode = [ "n" "x" ];
    }
    { # toggle num for buffer
      key = "<Leader>bI"; # tn
      action = "<cmd>lua vim.bo.number = not vim.bo.number<cr>";
      mode = [ "n" "x" ];
    }

    # FIXME
    { # toggle inlay hints
      key = "<Leader>bh"; # th
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
      mode = [ "n" "x" ];
    }
    # { # toggle inlay hints for buffer
    #   key = "<Leader>bH"; # th
    #   action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>";
    #   mode = [ "n" "x" ];
    # }

    {
      key = "<Leader>r";
      action = "mz<cmd>s/\\v(true|false)/\\={'true':'false','false':'true'}[submatch(0)]/g<cr>`z<cmd>nohlsearch<cr>";
      mode = [ "n" "x" ];
    }

    { # angle brackets
      key = "cij";
      action = "ci<";
      mode = "n";
    }
    { # angle brackets
      key = "dij";
      action = "di<";
      mode = "n";
    }
    { # angle brackets
      key = "vij";
      action = "vi<";
      mode = "n";
    }
    { # angle brackets
      key = "yij";
      action = "yi<";
      mode = "n";
    }
    { # angle brackets
      key = "caj";
      action = "ca<";
      mode = "n";
    }
    { # angle brackets
      key = "daj";
      action = "da<";
      mode = "n";
    }
    { # angle brackets
      key = "vaj";
      action = "va<";
      mode = "n";
    }
    { # angle brackets
      key = "yaj";
      action = "ya<";
      mode = "n";
    }





    # {
    #   key = "<C-n>";
    #   action = "I";
    #   mode = [ "n" "x" ];
    # }
    # {
    #   key = "<C-s>";
    #   action = "A";
    #   mode = [ "n" "x" ];
    # }
    # {
    #   key = "gi";
    #   action = "I";
    #   mode = [ "n" "x" ];
    # }
    # {
    #   key = "ga";
    #   action = "A";
    #   mode = [ "n" "x" ];
    # }

    {
      key = "<PageDown>";
      action = "<C-d>";
      mode = [ "n" "i" "x" ];
    }

    {
      key = "<PageUp>";
      action = "<C-u>";
      mode = [ "n" "i" "x" ];
    }

    { # avoid sfb/lsb for dd
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
      action = "<cmd>lua vim.lsp.buf.definition()<cr>";
      mode = [ "n" "v" "x" ];
      # lua = true;
    }

    {
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>";
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

    {
      key = "i(";
      action = ":echo \"use b instead of ( or )\"<cr>";
      mode = [ "o" "x" ];
    }
    {
      key = "i)";
      action = ":echo \"use b instead of ( or )\"<cr>";
      mode = [ "o" "x" ];
    }

    # { # put cursor at top of screen
    #   key = "zh";
    #   action = "zo";
    #   mode = [ "n" "v" "x" ];
    # }
    #
    # { # put cursor at top of screen
    #   key = "zw";
    #   action = "zc";
    #   mode = [ "n" "v" "x" ];
    # }
    #
    # { # put cursor at top of screen
    #   key = "zK";
    #   action = "z<cr>";
    #   mode = [ "n" "v" "x" ];
    # }
    #
    # { # put cursor at bottom of screen
    #   key = "zJ";
    #   action = "z-";
    #   mode = [ "n" "v" "x" ];
    # }
    #
    # { # put top of screen at cursor
    #   key = "zj";
    #   action = "zt";
    #   mode = [ "n" "v" "x" ];
    # }
    #
    # { # put bottom of screen at cursor
    #   key = "zk";
    #   action = "zb";
    #   mode = [ "n" "v" "x" ];
    # }

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
      action = "] ";
      mode = "n";
    }

    { # insert line above
      key = "<C-S-k>";
      action = "[ ";
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
      key = "x";
      action = "\"_x";
      mode = "n";
    }

    {
      key = "<C-backspace>";
      action = "<C-w>";
      mode = [ "i" "c" "t" ];
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

    { key = "{"; action = "("; mode = [ "n" "v" "x" "o" ]; }
    { key = "}"; action = ")"; mode = [ "n" "v" "x" "o" ]; }
    { key = "("; action = "}"; mode = [ "n" "v" "x" "o" ]; }
    { key = ")"; action = "{"; mode = [ "n" "v" "x" "o" ]; }

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

    # {
    #   key = "<tab>";
    #   action = "%";
    #   mode = [ "n" "v" "x" ];
    # }

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
      key = "<C-j>";
      action = "<C-a>";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "<C-e>";
      action = "<C-u>";
      mode = [ "n" "v" "x" ];
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

    {
      key = "<C-S-a>";
      action = ":m .+1<CR>==";
      mode = "n";
    }
    {
      key = "<C-S-e>";
      action = ":m .-2<CR>==";
      mode = "n";
    }

    {
      key = "<C-S-a>";
      action = ":'<,'>m .+1<CR>==";
      mode = "v";
    }
    {
      key = "<C-S-e>";
      action = ":'<,'>m .-2<CR>==";
      mode = "v";
    }

    # { key = "<left>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<down>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<up>"; action = ""; mode = [ "i" "n" "v" "x" ]; }
    # { key = "<right>"; action = ""; mode = [ "i" "n" "v" "x" ]; }


    ];
  };
}
