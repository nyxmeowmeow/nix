{ config, ... }: {
  programs.yazi = {
    settings = {
      mgr = {
        ratio          = [ 0 3 4 ];
        sort_by        = "natural";
        sort_sensitive = false;
        sort_reverse 	 = false;
        sort_dir_first = true;
        sort_translit  = false;
        linemode       = "none";
        show_hidden    = true;
        show_symlink   = true;
        mouse_events   = [];
        title_format   = "Yazi: {cwd}";

        # use same scrolloff as nvim
        scrolloff =
          config.programs.nixvim.opts.scrolloff;
      };

      preview = {
        tab_size        = 2;
        max_width       = 2560; # TODO resolution variable?
        max_height      = 1440;
        cache_dir       = "";
        image_delay     = 0;
        image_filter    = "triangle";
        image_quality   = 85;
        sixel_fraction  = 1;
        ueberzug_scale  = 1;
        ueberzug_offset = [ 0 0 0 0 ];
      };

      tasks = {
        micro_workers    = 10;
        macro_workers    = 10;
        bizarre_retry    = 3;
        image_alloc      = 536870912; # 512MB
          image_bound      = [ 0 0 ];
        suppress_preload = false;
      };

      which = {
        sort_by      	 = "none";
        sort_sensitive = false;
        sort_reverse 	 = false;
        sort_translit  = false;
      };
    };
  };
}
