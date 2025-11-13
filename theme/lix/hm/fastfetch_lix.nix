{ lib, theme, username, ... }: {
  config = lib.mkIf (theme == "lix") {

    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            left = 0;
            right = 2;
          };
        };

        display = {
          separator = " ";
        };

        modules = [
        {
          type = "command";
          key = "let ${username}: Host";
          keyColor = "magenta";
          text = "echo '= {'";
        }
        {
          type = "os";
          key = "  distro";
          format = "= \"{2}\",";
          keyColor = "magenta";
        }
        {
          type = "kernel";
          key = "  kernel";
          format = "= \"{2}\",";
          keyColor = "magenta";
        }
        {
          type = "packages";
          key = "  pkgs";
          format = "= {1},";
          keyColor = "magenta";
        }
# {
#   type = "display";
#   key = "   ds";
#   keyColor = "green";
# }
# {
#   type = "wm";
#   key = "wm";
#   keyColor = "magenta";
# }
        {
          type = "command";
          key = "  wm";
          keyColor = "magenta";
          # text = "echo ${config.wm}";
          text = "echo '= \"niri\",";
        }
# {
#   type = "terminal";
#   key = "tm";
#   keyColor = "magenta";
# }
        {
          type = "command";
          key = "  term";
          keyColor = "magenta";
          text = "echo '= \"foot\",'";
        }
# {
#   type = "shell";
#   key = "sh";
#   keyColor = "magenta";
# }
        {
          type = "command";
          key = "  shell";
          keyColor = "magenta";
          text = "echo '= \"nushell\",'";
        }
        {
          type = "cpu";
          format = "= \"{1}\",";
          key = "  cpu";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "= \"{2}\",";
          key = "  gpu";
          keyColor = "magenta";
        }
        # {
        #   type = "gpu";
        #   format = "{3}";
        #   key = "drv";
        #   keyColor = "magenta";
        # }
        # {
        #   type = "memory";
        #   key = "  memory";
        #   keyColor = "magenta";
        # }
        {
          type = "command";
          key = "  age";
          keyColor = "magenta";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo -n '= '; echo -n $days_difference; echo ','";
        }
        {
          type = "uptime";
          key = "  uptime";
          format = "= {3},";
          keyColor = "magenta";
        }
        {
          type = "command";
          key = "  theme";
          keyColor = "magenta";
          # text = "echo ${config.theme}";
          text = "echo '= \"lix\"'";
        }
        # {
        #   type = "colors";
        #   paddingLeft = 0;
        #   symbol = "circle";
        # }
        {
          type = "command";
          key = " ";
          padding.left = -2;
          text = "echo '};'";
        }
        ];
      };
    };
  };
}
