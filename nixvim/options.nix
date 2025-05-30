{
	programs.nixvim.opts = {
		termguicolors = true;
		number = true;
		relativenumber = true;

		shiftwidth = 4;
		tabstop = 4;
		expandtab = true;


        wrap = true;
        linebreak = true; # only wrap at whitespace
        breakindent = true; # indent wrap
        breakindentopt = "shift:2";
        showbreak = "↪ "; 

	};
	
}
