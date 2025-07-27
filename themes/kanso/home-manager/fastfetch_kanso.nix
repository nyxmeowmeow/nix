{ lib, theme, username, ... }: {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

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
          keyColor = "blue";
          text = "echo '= {'";
        }
        {
          type = "os";
          key = "  distro";
          format = "= \"{2}\",";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = "  kernel";
          format = "= \"{2}\",";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = "  pkgs";
          format = "= {1},";
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
          key = "  wm";
          keyColor = "blue";
          # text = "echo ${config.wm}";
          text = "echo '= \"niri\",";
        }
# {
#   type = "terminal";
#   key = "tm";
#   keyColor = "blue";
# }
        {
          type = "command";
          key = "  term";
          keyColor = "blue";
          text = "echo '= \"foot\",'";
        }
# {
#   type = "shell";
#   key = "sh";
#   keyColor = "blue";
# }
        {
          type = "command";
          key = "  shell";
          keyColor = "blue";
          text = "echo '= \"nushell\",'";
        }
        {
          type = "cpu";
          format = "= \"{1}\",";
          key = "  cpu";
          keyColor = "blue";
        }
        {
          type = "gpu";
          format = "= \"{2}\",";
          key = "  gpu";
          keyColor = "blue";
        }
        # {
        #   type = "gpu";
        #   format = "{3}";
        #   key = "drv";
        #   keyColor = "blue";
        # }
        # {
        #   type = "memory";
        #   key = "  memory";
        #   keyColor = "blue";
        # }
        {
          type = "command";
          key = "  age";
          keyColor = "blue";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo -n '= '; echo -n $days_difference; echo ','";
        }
        {
          type = "uptime";
          key = "  uptime";
          format = "= {3},";
          keyColor = "blue";
        }
        {
          type = "command";
          key = "  theme";
          keyColor = "blue";
          # text = "echo ${config.theme}";
          text = "echo '= \"kanso\"'";
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
