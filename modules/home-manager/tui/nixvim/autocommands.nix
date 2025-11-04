{
  programs.nixvim.autoCmd = [
  {
    event = [
      "BufEnter"
      "BufWinEnter"
    ];
    pattern = "*.md";
    command = "setlocal nonumber norelativenumber signcolumn=no";
  }
  {
    event = [
      "BufEnter"
      "BufWinEnter"
    ];
    pattern = "*";
    command = "loadview"; # load folds
  }
  ];
}
