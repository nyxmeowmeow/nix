{
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = config.stylix.fonts.monospace.name;
    font.size = 22;
    settings = {
      enable_audio_bell = false;
      disable_ligatures = true;
      box_drawing_scale = "2.0 2.0 2.0 2.0";

      cursor_shape_unfocused = "unchanged";

      cursor_trail = "1";

      sync_to_monitor = true;

      remember_window_size = false;
      remember_window_position = false;

      window_padding_width = "1 2";
      
      wayland_enable_ime = false;
    };
  };
}
