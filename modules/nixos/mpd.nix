{
  username,
  pkgs,
  ...
}: {
  services = {
    mpd = {
      enable = true;
      user = username;
      musicDirectory = "/home/${username}/Music/";
      dataDir = "/home/${username}/misc/mpd"; # TODO .local/share?
      extraConfig = ''
        port "6669"
        audio_output {
          type "pipewire"
          name "meowwire"
        }
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    mpc
  ];

  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000"; # only worked when i manually specified 1000
  };
}
