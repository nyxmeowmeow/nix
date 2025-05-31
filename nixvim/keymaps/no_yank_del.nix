{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    {
      key = "d";
      action = "\"_d";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "D";
      action = "\"_D";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "c";
      action = "\"_c";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "C";
      action = "\"_C";
      mode = [ "n" "v" "x" ];
    }
    {
      key = "x";
      action = "\"_x";
      mode = [ "n" "v" "x" ];
    }
    ];
  };

}
