{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
    {
      key = "p";
      action = "\"_dP"; # dont yank selected when pasting
      mode = [ "v" ];
    }
    {
      key = "<C-l>";
      action = "p"; # vanilla p behaviour
      mode = [ "v" ];
    }
    {
      key = "<C-o>";
      action = "d"; # vanilla d behaviour
      mode = [ "n" "v" "x" ];
    }
    {
      key = "<C-D>";
      action = "D"; # vanilla d behaviour
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
