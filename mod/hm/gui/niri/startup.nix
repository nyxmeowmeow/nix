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
    { command = [ "~/misc/niriusd" ]; }
    # { command = [ "hyprpaper" ]; }
    { command = [ "vesktop" "--enable-features=UseOzonePlatform" "--ozone-platform=wayland" ]; }
    { command = [ "steam" "-silent" ]; }
  ];
  };
}
