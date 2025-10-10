{ username, ... }: {
  security.rtkit.enable = true;
  security.sudo.extraRules = [
    {
      users = [ username ];
      commands = [
        { # keyb0xx no passwd
          command = "/run/current-system/sw/bin/steam-run /home/${username}/melee/keyb0xx";
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
