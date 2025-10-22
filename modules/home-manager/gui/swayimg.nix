{
  programs.swayimg = {
    enable = true;
    settings = {
      viewer = {
        window = "#090E13cc";
        scale = "fit";
      };
      "info.viewer" = {
        top_left = "none";
        top_right = "none";
        bottom-left = "none";
        bottom-right = "none";
      };
      "keys.viewer" = {
        "Shift+r" = "rotate_left";
        "r" = "rotate_right";
        "f" = "flip_horizontal";
        "Shift-f" = "flip_vertical";
        "v" = "flip_vertical";
        "h" = "prev_file";
        "i" = "next_file";
        "a" = "zoom +10";
        "e" = "zoom -10";
        "ScrollUp" = "zoom +10 mouse";
        "ScrollDown" = "zoom -10 mouse";
        "Escape" = "zoom optimal";
        "p" = "antialiasing";
        "Tab" = "info";
        "q" = "exit";
      };
    };
  };
}
