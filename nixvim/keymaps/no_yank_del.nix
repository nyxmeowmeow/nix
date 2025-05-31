{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    {
      key = "x";
      action = "d"; # vanilla d behaviour
      mode = [ "n" "v" "x" ];
    }
    {
      key = "X";
      action = "D"; # vanilla D behaviour
      mode = [ "n" "v" "x" ];
    }
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
