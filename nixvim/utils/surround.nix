{
  programs.nixvim.plugins.mini.modules.surround = {
    enable = true;
    mappings = {
      add = "sa";
      delete = "sd";
      find = "sf";
      find_left = "sF";
      highlight = "sh";
      update_n_lines = "sn";

      suffix_last = "l";
      suffix_next = "n";
    };
  };
}
