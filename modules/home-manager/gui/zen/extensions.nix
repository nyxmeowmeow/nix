{
  config,
  lib,
  pkgs,
  ...
}:
let
  meow_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    darkreader
    #bypass-paywalls-clean
    indie-wiki-buddy
    stylus
    canvasblocker
    fastforwardteam
    tridactyl
    bitwarden
    clearurls
    shinigami-eyes
    pronoundb
    # containerise
    don-t-fuck-with-paste
    google-container
    lovely-forks
    refined-github
    github-issue-link-status
    github-file-icons
    user-agent-string-switcher
    userchrome-toggle
  ];

  media_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    sponsorblock
    return-youtube-dislikes
    darkreader
    #bypass-paywalls-clean
    stylus
    canvasblocker
    fastforwardteam
    tridactyl
    bitwarden
    clearurls
    # "7tv"
    betterttv
    shinigami-eyes
    pronoundb
    blocktube
    don-t-fuck-with-paste
    google-container
    user-agent-string-switcher
    userchrome-toggle
  ];

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
