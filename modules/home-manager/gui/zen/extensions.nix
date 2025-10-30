{
  config,
  lib,
  pkgs,
  ...
}:
let
  shared_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    darkreader
    bitwarden
    userchrome-toggle
    user-agent-string-switcher
    stylus
    canvasblocker
    tridactyl
    clearurls
    fastforwardteam
    shinigami-eyes
    #bypass-paywalls-clean
    pronoundb
    don-t-fuck-with-paste
    google-container
    # containerise
  ];

  meow_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    indie-wiki-buddy
    lovely-forks
    refined-github
    github-issue-link-status
    github-file-icons
  ] ++ shared_extensions;

  media_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    sponsorblock
    return-youtube-dislikes
    # "7tv"
    betterttv
    blocktube
    # TODO alternate player for twitch
  ] ++ shared_extensions;

in {
  programs.zen-browser.profiles."meow".extensions = {
    packages = meow_extensions;
    force = true;
  };

  programs.zen-browser.profiles."media".extensions = {
    packages = media_extensions;
    force = true;
  };
}
