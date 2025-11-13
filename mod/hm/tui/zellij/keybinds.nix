{
  programs.zellij = {
    enable = true;
    settings = {
      keybinds.pane._children = [
      # {
      #   bind = {
      #     _args = ["e"];
      #     _children = [
      #     { TogglePaneEmbedOrFloating = {}; }
      #     { SwitchToMode._args = ["locked"]; }
      #     ];
      #   };
      # }
      {
        bind = {
          _args = ["h"];
          MoveFocus = ["left"];
        };
      }
      {
        bind = {
          _args = ["a"];
          MoveFocus = ["down"];
        };
      }
      {
        bind = {
          _args = ["e"];
          MoveFocus = ["up"];
        };
      }
      {
        bind = {
          _args = ["i"];
          MoveFocus = ["right"];
        };
      }

      {
        bind = {
          _args = ["Enter"];
          NewPane = {};
        };
      }
      ];

      keybinds.normal._children = [
      { # quit
        bind = {
          _args = ["q"];
          Quit = {};
        };
      }
      { # close tab
        bind = {
          _args = ["o"];
          CloseTab = {};
        };
      }
      { # detach
        bind = {
          _args = ["d"];
          Detach = {};
        };
      }
      { # edit scrollback
        bind = {
          _args = ["e"];
          EditScrollback = {};
        };
      }
      ];

      keybinds.tab._children = [
      { # prev tab
        bind = {
          _args = ["h"];
          GoToPrevTab = {};
        };
      }
      { # next tab
        bind = {
          _args = ["i"];
          GoToNextTab = {};
        };
      }
      ];

      keybinds.scroll._children = [
      { # scroll down
        bind = {
          _args = ["a"];
          HalfPageScrollDown = {};
        };
      }
      { # scroll up
        bind = {
          _args = ["e"];
          HalfPageScrollUp = {};
        };
      }

      { # scroll to top
        bind = {
          _args = ["h"];
          ScrollToTop = {};
        };
      }
      { # scroll to bottom
        bind = {
          _args = ["i"];
          ScrollToBottom = {};
        };
      }
      ];
    };
  };
}
