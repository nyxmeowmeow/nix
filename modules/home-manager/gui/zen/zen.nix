{
  inputs,
  pkgs,
  ...
}:
let

settings = {

  "browser.tabs.allow_transparent_browser" = true;
  "zen.widget.linux.transparency" = true;
  "browser.tabs.inTitlebar" = 0; # needed for transparency
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  "sidebar.verticalTabs" = true;
# "browser.uiCustomization.navBarWhenVerticalTabs" = [
#   "urlbar-container"
#   "downloads-button"
#   "fxa-toolbar-menu-button"
#   "unified-extensions-button"
# ];
  "devtools.chrome.enabled" = true;
  "devtools.debugger.remote-enabled" = true;

  "browser.search.region" = "AU";
  "browser.search.isUS" = false;
  "browser.startup.homepage" = "duckduckgo.com";
  "general.useragent.locale" = "en-AU";
  "browser.bookmarks.showMobileBookmarks" = false;

# meow >:(
    "browser.ml.chat.enabled" = false;
    "browser.ml.chat.hideLocalhost" = false;
    "browser.ml.chat.menu" = false;
    "browser.ml.chat.sidebar" = false;
    "browser.tabs.groups.smart.enabled" = false;

    "ui.key.menuAccessKeyFocuses" = true; # disable <ALT> menu

    "browser.startup.page" = 3; # restore previous session
    "browser.sessionstore.resume_from_crash" = true;
    "layout.css.grid-template-masonry-value.enabled" = true;

    "browser.urlbar.trimHttps" = true;
    "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
    "browser.search.separatePrivateDefault.ui.enabled" = true;
    "browser.search.suggest.enabled" = false;
# "browser.urlbar.quicksuggest.enabled" = false;
# "browser.urlbar.groupLabels.enabled" = false;
    "browser.formfill.enable" = false;
# "network.IDN_show_punycode" = true;

    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.server" = "data:,";
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.coverage.opt-out" = true;
    "toolkit.coverage.opt-out" = true;
    "toolkit.coverage.endpoint.base" = "";
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "datareporting.usage.uploadEnabled" = false;

    "browser.privatebrowsing.vpnpromourl" = "";
# "extensions.getAddons.showPane" = false;
    "extensions.htmlaboutaddons.recommendations.enabled" = true;
    "browser.discovery.enabled" = false;
    "browser.shell.checkDefaultBrowser" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
    "browser.preferences.moreFromMozilla" = false;
    "browser.aboutConfig.showWarning" = false;
    "browser.aboutwelcome.enabled" = false;
    "browser.profiles.enabled" = true;

    "full-screen-api.transition-duration.enter" = "0 0";
    "full-screen-api.transition-duration.leave" = "0 0";
    "full-screen-api.warning.timeout" = 0;

    "browser.newtabpage.activity-stream.default.sites" = "";
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
    "browser.newtabpage.activity-stream.showSponsored" = false;

    "extensions.pocket.enabled" = false;
    "browser.download.manager.addToRecentDocs" = false;
};


in {
  imports = [
    inputs.zen-browser.homeModules.twilight
      ./search-engines.nix
      ./extensions.nix
      ./userchrome.nix
  ];

  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles = {
      "meow" = {
        isDefault = true;
        id = 0;
        settings = settings;
      };

      "media" = {
        id = 1;
        settings = settings;
      };
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableFirefoxScreenshots = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
      };
      HardwareAcceleration = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;

      Preferences = {
        "browser.tabs.warnOnClose" = {
          "Value" = false;
          "Status" = "locked";
        };
      };
    };
  };
}
