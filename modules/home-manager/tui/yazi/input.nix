{
  programs.yazi.settings.input = {
    cursor_blink = false;

    # cd
    cd_title  = "";
    cd_origin = "center";
    cd_offset = [ 0 0 50 3 ];

    # create
    create_title  = [ "" "" ];
    create_origin = "center";
    create_offset = [ 0 0 50 3 ];

    # rename
    rename_title  = "";
    rename_origin = "hovered";
    rename_offset = [ 0 1 50 3 ];

    # filter
    filter_title  = "";
    filter_origin = "center";
    filter_offset = [ 0 0 50 3 ];

    # find
    find_title  = [ "" "" ];
    find_origin = "center";
    find_offset = [ 0 0 50 3 ];

    # search
    search_title  = " {n} ";
    search_origin = "center";
    search_offset = [ 0 0 50 3 ];

    # shell
    shell_title  = [ "" "" ];
    shell_origin = "center";
    shell_offset = [ 0 0 50 3 ];

    pick = {
      open_title  = "";
      open_origin = "hovered";
      open_offset = [ 0 1 50 7 ];
    };

    confirm = {
      # trash
      trash_title 	= " Trash {n} selected file{s}? ";
      trash_origin	= "center";
      trash_offset	= [ 0 0 70 20 ];

      # delete
      delete_title 	= " PERMANENTLY delete {n} selected file{s}? ";
      delete_origin	= "center";
      delete_offset	= [ 0 0 70 20 ];

      # overwrite
      overwrite_title   = " Overwrite file? ";
      overwrite_content = "Will overwrite the following file:";
      overwrite_origin  = "center";
      overwrite_offset  = [ 0 0 50 15 ];

      # quit
      quit_title   = " Quit? ";
      quit_content = "The following tasks are still running, are you sure you want to quit?";
      quit_origin  = "center";
      quit_offset  = [ 0 0 50 15 ];
    };
  };
}
