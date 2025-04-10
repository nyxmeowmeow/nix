{ config, pkgs, ... }: {

  programs.ncmpcpp = {
    enable = true;
    bindings = [
      { key = "a"; command = "scroll_down"; }
      { key = "e"; command = "scroll_up"; }
      { key = "h"; command = "previous_column"; }
      { key = "i"; command = "next_column"; }
      { key = "ctrl-a"; command = "page_down"; }
      { key = "ctrl-e"; command = "page_up"; }
      { key = "("; command = "previous"; }
      { key = ")"; command = "next"; }
      { key = "enter"; command = "play_item"; }
      { key = "s"; command = "find_item_forward"; }
      { key = ";"; command = "find_item_forward"; }
      { key = "p"; command = "next_found_item"; }
      { key = "P"; command = "previous_found_item"; }
      { key = " "; command = "pause"; }
    ];
    # settings = [

    # ];
  }
