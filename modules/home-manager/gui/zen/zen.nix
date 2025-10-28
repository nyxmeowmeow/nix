{
  inputs,
  pkgs,
  ...
}:
{
# imports = [
#   inputs.zen-browser.homeModules.twilight
#   ./userchrome/meow.nix
# ];

  home.packages = [
    inputs.zen-browser.packages."x86_64-linux".beta
  ];

#   programs.zen-browser = {
#     enable = true;
#     nativeMessagingHosts = [ pkgs.firefoxpwa ];
#     profiles = {
#       meow = {
#         isDefault = true;
#         name = "meow";
#         id = 0;
# # preConfig = ''
# # '';
#
#         search = {
#           force = true;
#           default = "ddg";
#           order = ["ddg" "google"];
#         };
#         settings = {
#           "browser.search.region" = "AU";
#           "browser.search.isUS" = false;
#           "browser.startup.homepage" = "duckduckgo.com";
#           "general.useragent.locale" = "en-AU";
#           "browser.bookmarks.showMobileBookmarks" = false;
# # meow >:(
#     "browser.ml.chat.enabled" = false;
#     "browser.ml.chat.hideLocalhost" = false;
#     "browser.ml.chat.menu" = false;
#     "browser.tabs.groups.smart.enabled" = false;
#
#     "ui.key.menuAccessKeyFocuses" = false; # disable <ALT> menu
#
#     "browser.startup.page" = 3; # restore previous session
#     "browser.sessionstore.resume_from_crash" = true;
#     "layout.css.grid-template-masonry-value.enabled" = true;

#    "browser.urlbar.trimHttps" = true;
#    "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
#    "browser.search.separatePrivateDefault.ui.enabled" = true;
#    "browser.search.suggest.enabled" = false;
#    # "browser.urlbar.quicksuggest.enabled" = false;
#    # "browser.urlbar.groupLabels.enabled" = false;
#    "browser.formfill.enable" = false;
#    # "network.IDN_show_punycode" = true;

    # "datareporting.policy.dataSubmissionEnabled" = false;
    # "datareporting.healthreport.uploadEnabled" = false;
    # "toolkit.telemetry.unified" = false;
    # "toolkit.telemetry.enabled" = false;
    # "toolkit.telemetry.server" = "data:,";
    # "toolkit.telemetry.archive.enabled" = false;
    # "toolkit.telemetry.newProfilePing.enabled" = false;
    # "toolkit.telemetry.shutdownPingSender.enabled" = false;
    # "toolkit.telemetry.updatePing.enabled" = false;
    # "toolkit.telemetry.bhrPing.enabled" = false;
    # "toolkit.telemetry.firstShutdownPing.enabled" = false;
    # "toolkit.telemetry.coverage.opt-out" = true;
    # "toolkit.coverage.opt-out" = true;
    # "toolkit.coverage.endpoint.base" = "";
    # "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    # "browser.newtabpage.activity-stream.telemetry" = false;
    # "datareporting.usage.uploadEnabled" = false;
    #
    # "browser.privatebrowsing.vpnpromourl" = "";
    # # "extensions.getAddons.showPane" = false;
    # # "extensions.htmlaboutaddons.recommendations.enabled" = false;
    # "browser.discovery.enabled" = false;
    # "browser.shell.checkDefaultBrowser" = false;
    # "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
    # "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
    # "browser.preferences.moreFromMozilla" = false;
    # "browser.aboutConfig.showWarning" = false;
    # "browser.aboutwelcome.enabled" = false;
    # "browser.profiles.enabled" = true;

    # "full-screen-api.transition-duration.enter" = "0 0";
    # "full-screen-api.transition-duration.leave" = "0 0";
    # "full-screen-api.warning.timeout" = 0;
    #
    # "browser.newtabpage.activity-stream.default.sites" = "";
    # "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    # "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    # "browser.newtabpage.activity-stream.showSponsored" = false;
    #
    # "extensions.pocket.enabled" = false;
    # "browser.download.manager.addToRecentDocs" = false;




#
#     };
#     };
#     };
#     policies = {
#     AutofillAddressEnabled = false;
#     AutofillCreditCardEnabled = false;
#     DisableAppUpdate = true;
#     DisableFeedbackCommands = true;
#     DisableFirefoxStudies = true;
#     DisableFirefoxScreenshots = true;
#     DisablePocket = true;
#     DisableTelemetry = true;
#     DontCheckDefaultBrowser = true;
#     EnableTrackingProtection = {
#       Value = true;
#       Locked = true;
#       Cryptomining = true;
#       Fingerprinting = true;
#     };
#     UserMessaging = {
#       ExtensionRecommendations = false;
#       UrlbarInterventions = false;
#       SkipOnboarding = true;
#     };
#     HardwareAcceleration = true;
#     NoDefaultBookmarks = true;
#     OfferToSaveLogins = false;
#     OfferToSaveLoginsDefault = false;
#
#     Preferences = {
#       "browser.tabs.warnOnClose" = {
#         "Value" = false;
#         "Status" = "locked";
#       };
#       ExtensionSettings = {
# # ublock origin
#         "uBlock0@raymondhill.net" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4458450/ublock_origin-1.63.2.xpi";
#           installation_mode = "force_installed";
#         };
#
# # fastforward
#         "addon@fastforward.team" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4258067/fastforwardteam-0.2383.xpi";
#           installation_mode = "force_installed";
#         };
#
# # bitwarden
#         "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4484791/bitwarden_password_manager-2025.4.0.xpi";
#           installation_mode = "force_installed";
#         };
#
# # clear urls
#         "{74145f27-f039-47ce-a470-a662b129930a}" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
#           installation_mode = "force_installed";
#         };
#
# # dark reader
#         "addon@darkreader.org" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4488139/darkreader-4.9.106.xpi";
#           installation_mode = "force_installed";
#         };
#
# # stylus
#         "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4451438/styl_us-2.3.14.xpi";
#           installation_mode = "force_installed";
#         };
#
# # tridactyl
#         "tridactyl.vim@cmcaine.co.uk" = {
#           install_url = "https://addons.mozilla.org/firefox/downloads/file/4405615/tridactyl_vim-1.24.2.xpi";
#           installation_mode = "force_installed";
#         };
#
#
#
#
#       };
#     };
#     };
#   };
                       }
