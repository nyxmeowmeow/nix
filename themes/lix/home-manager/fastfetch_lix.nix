{ lib, theme, config, ... }: {
  config = lib.mkIf (theme == "lix") {

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
          type = "command";
          key = "let";
          keyColor = "magenta";
          text = "echo 'meow = {'";
        }
        {
          type = "os";
          key = "os";
          keyColor = "magenta";
        }
        {
          type = "kernel";
          key = "kn";
          keyColor = "magenta";
        }
        {
          type = "packages";
          key = "pk";
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
          key = "wm";
          keyColor = "magenta";
          # text = "echo ${config.wm}";
          text = "echo a";
        }
# {
#   type = "terminal";
#   key = "tm";
#   keyColor = "magenta";
# }
        {
          type = "command";
          key = "tm";
          keyColor = "magenta";
          text = "echo foot";
        }
# {
#   type = "shell";
#   key = "sh";
#   keyColor = "magenta";
# }
        {
          type = "command";
          key = "sh";
          keyColor = "magenta";
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
          text = "echo lix";
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
  };
}
