{
  flake_dir,
  lib,
  wm,
  ...
}:
{
  config = lib.mkIf (wm == "niri") {
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${flake_dir}/stuff/scripts/startup.sh" ]; }
# TODO kitty -1
    { command = [ "${flake_dir}/stuff/scripts/swww.sh" ]; }
    { command = [ "clipse" "-listen" ]; }
    { command = [ "udiskie" "-a" ]; }
    { command = [ "dunst" ]; }
    { command = [ "niriusd" ]; }
    # { command = [ "hyprpaper" ]; }
    { command = [ "vesktop" "--enable-features=UseOzonePlatform" "--ozone-platform=wayland" ]; }
    { command = [ "steam" "-silent" ]; }
    { command =  [ "ghostty" "--title=\"ghostty_nvim\"" "-e" "nvim" ]; }
    { command =  [ "ghostty" "--title=\"ghostty_term\"" ]; }
    { command =  [ "ghostty" "--title=\"ghostty_yazi\"" "-e" "yazi" ]; }
  ];
  };
}
