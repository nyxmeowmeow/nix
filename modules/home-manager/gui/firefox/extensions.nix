{
  config,
  lib,
  pkgs,
  ...
}:
let
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    sponsorblock
    return-youtube-dislikes
    darkreader
    #bypass-paywalls-clean
    indie-wiki-buddy
    stylus
    canvasblocker
    fastforwardteam
    tridactyl
  ];
in
{
  programs.firefox.profiles."meow".extensions = {
    packages = extensions;
    force = true;
  };
}
