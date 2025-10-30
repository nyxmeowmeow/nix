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
];

  meow_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #bypass-paywalls-clean
    indie-wiki-buddy
    stylus
    canvasblocker
    fastforwardteam
    tridactyl
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
  ] ++ shared_extensions;

  media_extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    sponsorblock
    return-youtube-dislikes
    #bypass-paywalls-clean
    stylus
    canvasblocker
    fastforwardteam
    tridactyl
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
