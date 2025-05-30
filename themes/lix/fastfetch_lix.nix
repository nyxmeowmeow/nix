{ ... }: {

  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          left = 1;
          right = 2;
        };
      };

      display = {
        separator = "  ";
      };

      modules = [
        {
          type = "os";
          key = "os";
          keyColor = "foreground";
        }
        {
          type = "kernel";
          key = "kn";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "pk";
          keyColor = "blue";
        }
        # {
        #   type = "display";
        #   key = "   ds";
        #   keyColor = "green";
        # }
        # {
        #   type = "wm";
        #   key = "wm";
        #   keyColor = "blue";
        # }
        {
          type = "command";
          key = "wm";
          keyColor = "blue";
          text = "echo hyprland";
        }
        # {
        #   type = "terminal";
        #   key = "tm";
        #   keyColor = "blue";
        # }
        {
          type = "command";
          key = "tm";
          keyColor = "blue";
          text = "echo foot";
        }
        # {
        #   type = "shell";
        #   key = "sh";
        #   keyColor = "blue";
        # }
        {
          type = "command";
          key = "sh";
          keyColor = "blue";
          text = "echo nushell";
        }
        "break"
        {
          type = "cpu";
          format = "{1}";
          key = "cpu";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{2}";
          key = "gpu";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{3}";
          key = "drv";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = "mem";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "age";
          keyColor = "magenta";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "utm";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "col";
          keyColor = "magenta";
          text = "echo Catppuccin Macchiato";
        }
        {
          type = "colors";
          paddingLeft = 0;
          symbol = "circle";
        }
        "break"
      ];
    };
  };
}
