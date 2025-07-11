{
  programs.nixvim.autocmds = [
  {
    event = "FileType";
    pattern = "markdown";
    command = "setlocal nonumber norelativenumber";
  }
  ];
}
