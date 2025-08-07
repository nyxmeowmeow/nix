{ inputs, pkgs, ... }: {


  imports = [
    inputs.zen-browser.homeModules.twilight
  ];


  programs.zen-browser = {
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      Preferences = {
        "browser.tabs.warnOnClose" = {
          "Value" = false;
          "Status" = "locked";
        };
      ExtensionSettings = {
        # ublock origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4458450/ublock_origin-1.63.2.xpi";
          installation_mode = "force_installed";
        };

        # fastforward
        "addon@fastforward.team" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4258067/fastforwardteam-0.2383.xpi";
          installation_mode = "force_installed";
        };

        # bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4484791/bitwarden_password_manager-2025.4.0.xpi";
          installation_mode = "force_installed";
        };

        # clear urls
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4432106/clearurls-1.27.3.xpi";
          installation_mode = "force_installed";
        };

        # dark reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4488139/darkreader-4.9.106.xpi";
          installation_mode = "force_installed";
        };

        # stylus
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4451438/styl_us-2.3.14.xpi";
          installation_mode = "force_installed";
        };

        # tridactyl
        "tridactyl.vim@cmcaine.co.uk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4405615/tridactyl_vim-1.24.2.xpi";
          installation_mode = "force_installed";
        };




      };
      };
    };
  };

}
