{
  username,
  ...
}: {
  systemd.user.tmpfiles.rules = [
    # trash
    "d /home/${username}/.local/share/Trash - - - 14d"

    # discord
    "d /home/${username}/.config/discord/Cache/Cache_Data - - - 10d"
    "d /home/${username}/.config/vesktop/sessionData/Cache/Cache_Data - - - 10d"

    # thumbnails
    "d /home/${username}/.cache/thumbnails - - - 1d"
    "d /tmp/yazi-1000 - - - 1d"

    "d /home/${username}/.local/share/com.rqbit.session - - - 3d"
  ];
}
