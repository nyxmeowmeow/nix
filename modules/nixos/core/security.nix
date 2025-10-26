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
}
