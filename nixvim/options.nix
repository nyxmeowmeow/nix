{
  programs.nixvim.opts = {
    termguicolors = true;

    number = true;
    relativenumber = true;

    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;

    ignorecase = true;
    smartcase = true;


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
