{
  programs.nixvim.opts = {
    termguicolors = true;

    number = true;
    relativenumber = false;
    signcolumn = "number";

    scrolloff = 10;

    cursorline = true;

    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;

    ignorecase = true;
    smartcase = true;

    autochdir = true; # auto cd into current buffers dir

    autoindent = true;
    smartindent = true;
    smarttab = true;

    # guifont = "mononoki:h25";

    wrap = true;
    linebreak = true; # only wrap at whitespace
    breakindent = true; # indent wrap
    breakindentopt = "shift:2";
    showbreak = "↪ "; 


    splitbelow = true;
    splitright = true;
    undofile = true;

    #"vim.diagnostic.severity.ERROR".icon = " ";
    #"vim.diagnostic.severity.HINT".icon = " ";
    #"vim.diagnostic.severity.INFO".icon = " ";
    #"vim.diagnostic.severity.WARN".icon = " ";
  };
}
