{
  pkgs,
  username,
  ...
}:
{
  users.users.${username}.extraGroups = [ "gamemode" ];

  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
      };
    };
  };
}
