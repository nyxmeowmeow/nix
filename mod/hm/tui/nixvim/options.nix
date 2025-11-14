# { rounding, ... }:
{
  programs.nixvim.opts = {
    termguicolors = true;

    # winborder = if rounding then "rounded" else "single";

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

    confirm = true; # confirm for :q with unsaved changes instead of failing


    splitbelow = true;
    splitright = true;
    undofile = true;

    #"vim.diagnostic.severity.ERROR".icon = " ";
    #"vim.diagnostic.severity.HINT".icon = " ";
    #"vim.diagnostic.severity.INFO".icon = " ";
    #"vim.diagnostic.severity.WARN".icon = " ";

    foldcolumn = "auto";
    foldmethod = "marker";
# todo remove the triple brace
    foldtext = "substitute(getline(v:foldstart),'/\\\*\\\\\|\\\*/\\\\\|{{{\\\d\\\=','','g')";
  };
}
