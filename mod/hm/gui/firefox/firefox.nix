{
  pkgs,
  inputs,
  ...
}:
let
  # Firefox Nightly with https://github.com/MrOtherGuy/fx-autoconfig
  firefox-nightly = (
    (inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin).override {
      extraPrefsFiles = [
        (builtins.fetchurl {
          url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
          sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
        })
      ];
    }
  ).overrideAttrs (oldAttrs: {
    buildCommand = (oldAttrs.buildCommand or "") + ''
      # Find firefox dir
      firefoxDir=$(find "$out/lib/" -type d -name 'firefox*' -print -quit)

      # Function to replace symlink with destination file
      replaceSymlink() {
        local symlink_path="$firefoxDir/$1"
        local target_path=$(readlink -f "$symlink_path")
        rm "$symlink_path"
        cp "$target_path" "$symlink_path"
      }

      # Copy firefox binaries
      replaceSymlink "firefox"
      replaceSymlink "firefox-bin"
    '';
  });




  settings = {
    "floorp.panelSidebar.enabled" = false;

    "browser.tabs.allow_transparent_browser" = true;
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


in {
  # imports = [
  #   ./search-engines.nix
  #   ./extensions.nix
  #   ./userchrome.nix
  # ];
  # xdg.mimeApps.defaultApplications = {
  #   "default-web-browser" = [ "floorp.desktop" ];
  #   # "text/html" = [ "floorp.desktop" ];
  #   "x-scheme-handler/http" = [ "floorp.desktop" ];
  #   "x-scheme-handler/https" = [ "floorp.desktop" ];
  #   "x-scheme-handler/about" = [ "floorp.desktop" ];
  #   "x-scheme-handler/unknown" = [ "floorp.desktop" ];
  #   # "application/xhtml+xml" = [ "floorp.desktop" ];
  #   # "text/xml" = [ "floorp.desktop" ];
  # };
  #
  #
  #
  # programs.floorp = {
  #   enable = true;
  #
  #   nativeMessagingHosts = [ pkgs.tridactyl-native ];
  #   policies = policies;
  #   profiles = {
  #     "meow" = {
  #       isDefault = true;
  #       settings = settings;
  #     };
  #   };
  # };
}
