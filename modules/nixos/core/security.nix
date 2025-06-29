{

  security.rtkit.enable = true;

  security.sudo.extraRules = [
    {
      users = [ "meow" ];
      commands = [
        { # rebuild no passwd
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
        { # rebuild no passwd
          command = "/run/current-system/sw/bin/nh";
          options = [ "NOPASSWD" ];
        }
        { # kanata no passwd
          command = "/run/current-system/sw/bin/kanata";
          options = [ "NOPASSWD" ];
        }
        { # keyb0xx no passwd
          command = "/run/current-system/sw/bin/steam-run /home/meow/melee/keyb0xx";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];


  security.polkit = {
    enable = true;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        if (action.id == "org.freedesktop.udisks2.filesystem-mount" && subject.isInGroup("wheel")) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
