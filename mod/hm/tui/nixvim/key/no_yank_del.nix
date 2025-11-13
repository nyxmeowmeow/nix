{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [

    { # vanilla d behaviour
      key = "<C-o>";
      action = "d";
      mode = [ "n" "v" "x" ];
    }

    { # vanilla d behaviour
      key = "<C-d>";
      action = "D";
      mode = [ "n" "v" "x" "o" ];
    }

    {
      key = "d";
      action = "\"_d";
      mode = [ "n" "v" "x" ];
    }

    {
      key = "D";
      action = "\"_D";
      mode = [ "n" "v" "x" "o" ];
    }

    {
      key = "c";
      action = "\"_c";
      mode = [ "n" "v" "x" "o" ];
    }

    {
      key = "C";
      action = "\"_C";
      mode = [ "n" "v" "x" "o" ];
    }

    ];
  };

}
