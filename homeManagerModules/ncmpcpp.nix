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
    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/misc/lyrics";
      mpd_host = "localhost";
      mpd_port = "6669";
      mpd_music_dir = "~/Music";


      song_list_format = "{%t - }{%a}|{$5%f$9}$R{$5%l$9}";
      song_status_format = "{{%t - }{%a}}|{%f}";
      song_library_format = "{%n - }{%t}|{%f} ";
      alternative_header_first_line_format = "$b$1$aqqu$/a$9 {%t}|{%f} $1$atqq$/a$9$/b";
      alternative_header_second_line_format = "{{$4$b%a$/b$9}{ - $7%b$9}{ ($4%y$9)}}|{%D}";
      current_item_prefix = "$(blue)$r";
      current_item_suffix = "$/r$(end)";
      current_item_inactive_column_prefix = "$(blue)$r";
      current_item_inactive_column_suffix = "$/r$(end)";
      now_playing_prefix = "$b";
      now_playing_suffix = "$/b";
      browser_playlist_prefix = "'$2playlist$9 '";
      selected_item_prefix = "$6";
      selected_item_suffix = "$9";
      modified_item_prefix = "$3> $9";

      progressbar_look = "⠀";

      ## Available values: classic, alternative.
      user_interface = "classic";
      data_fetching_delay = "yes";
      ## Available values: artist, album_artist, date, genre, composer, performer.
      media_library_primary_tag = "artist";
      media_library_albums_split_by_date = "yes";
      media_library_hide_album_dates = "no";
      ## Available values: wrapped, normal.
      default_find_mode = "wrapped";
      default_tag_editor_pattern = "%n - %t";
      header_visibility = "yes";
      statusbar_visibility = "yes";

      # Show the "Connected to ..." message on startup
      connected_message_on_startup = "no";
      titles_visibility = "yes";
      header_text_scrolling = "yes";
      cyclic_scrolling = "no";
      lyrics_fetchers = "tags, genius, tekstowo, plyrics, justsomelyrics, jahlyrics, zeneszoveg, internet";
      follow_now_playing_lyrics = "no";
      fetch_lyrics_for_current_song_in_background = "no";
      store_lyrics_in_song_dir = "no";
      generate_win32_compatible_filenames = "yes";
      allow_for_physical_item_deletion = "no";

      screen_switcher_mode = "playlist, browser";
      startup_screen = "browser";
      startup_slave_screen = "";

      startup_slave_screen_focus = "no";
      locked_screen_width_part = "50";

      ask_for_locked_screen_width_part = "yes";
      media_library_column_width_ratio_two = "1:1";
      media_library_column_width_ratio_three = "1:1:1";
      playlist_editor_column_width_ratio = "1:2";
      jump_to_now_playing_song_at_start = "yes";
      ask_before_clearing_playlists = "yes";
      clock_display_seconds = "no";
      display_volume_level = "no";
      display_bitrate = "no";
      display_remaining_time = "no";
      regular_expressions = "perl";
      ignore_leading_the = "no";

      external_editor = "nvim";
      use_console_editor = "yes";

      colors_enabled = "yes";
      empty_tag_color = "cyan";
      header_window_color = "default";
      volume_color = "default";
      state_line_color = "default";
      state_flags_color = "default:b";
      main_window_color = "blue";
      color1 = "blue";
      color2 = "green";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "blue:b";
      statusbar_color = "default";
      statusbar_time_color = "default:b";
      player_state_color = "default:b";
      alternative_ui_separator_color = "blue:b";
      window_border_color = "green";
      active_window_border = "red";
    };
  };
}
