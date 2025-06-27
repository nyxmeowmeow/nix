{
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;

    select = {
      enable = true;
      lookahead = true;
      # keymaps = {
      #   "aa" = "@parameter.outer";
      #   "ia" = "@parameter.inner";
      #   "af" = "@function.outer";
      #   "if" = "@function.inner";
      #   "ac" = "@class.outer";
      #   "ic" = "@class.inner";
      #   "as" = "@local.scope";
      #   "ii" = "@conditional.inner";
      #   "ai" = "@conditional.outer";
      #   "il" = "@loop.inner";
      #   "al" = "@loop.outer";
      #   "at" = "@comment.outer";
      # };
    };
  };
}
