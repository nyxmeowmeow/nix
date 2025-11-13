{
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;

    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "a=" = {
            query = "@assignment.outer";
            desc = "Select [a]round outer part of an [=] assignment";
          };
          "i=" = {
            query = "@assignment.inner";
            desc = "Select [i]nner part of an [=] assignment";
          };
          "[=" = {
            query = "@assignment.lhs";
            desc = "Select [l]eft hand side of an [=] assignment";
          };
          "]=" = {
            query = "@assignment.rhs";
            desc = "Select [r]ight hand side of an [=] assignment";
          };
          "aa" = {
            query = "@parameter.outer";
            desc = "Select [a]round the outer part of a p[a]rameter";
          };
          "ia" = {
            query = "@parameter.inner";
            desc = "Select the [i]nner part of a p[a]rameter";
          };
          "ai" = {
            query = "@conditional.outer";
            desc = "Select [a]round the outer part of a cond[i]tional";
          };
          "ii" = {
            query = "@conditional.inner";
            desc = "Select the [i]nner part of a cond[i]tional";
          };
          "[i" = {
            query = "@conditional.lhs";
            desc = "Select left hand side of a cond[i]tional";
          };
          "]i" = {
            query = "@conditional.rhs";
            desc = "Select right hand side of a cond[i]tional";
          };
          "al" = {
            query = "@loop.outer";
            desc = "Select [a]round the outer part of a [l]oop";
          };
          "il" = {
            query = "@loop.inner";
            desc = "Select the [i]nner part of a [l]oop";
          };
          "af" = {
            query = "@call.outer";
            desc = "Select [a]round the outer part of a function call";
          };
          "if" = {
            query = "@call.inner";
            desc = "Select the [i]nner part of a function call";
          };
          "am" = {
            query = "@function.outer";
            desc = "Select [a]round the outer part of [m]ethod or function";
          };
          "im" = {
            query = "@function.inner";
            desc = "Select the [i]nner part of a [m]ethod or function";
          };
          "ac" = {
            query = "@class.outer";
            desc = "Select [a]round the outer part of a [c]lass";
          };
          "ic" = {
            query = "@class.inner";
            desc = "Select the [i]nner part of a [c]lass";
          };
        };
      };
    };
  };
}
