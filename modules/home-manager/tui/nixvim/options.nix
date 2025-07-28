{
  programs.nixvim.opts = {
    termguicolors = true;

    number = true;
    relativenumber = false;
    signcolumn = "number";

    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;

    ignorecase = true;
    smartcase = true;

    autochdir = true; # auto cd into current buffers dir

    guifont = "mononoki:h25";

    wrap = true;
    linebreak = true; # only wrap at whitespace
      breakindent = true; # indent wrap
      breakindentopt = "shift:2";
    showbreak = "↪ "; 

    #"vim.diagnostic.severity.ERROR".icon = " ";
    #"vim.diagnostic.severity.HINT".icon = " ";
    #"vim.diagnostic.severity.INFO".icon = " ";
    #"vim.diagnostic.severity.WARN".icon = " ";
  };
}
