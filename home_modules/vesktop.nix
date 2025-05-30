{ ... }: {

  home.file.".config/vesktop/themes/nyxtheme.css".source = ../stuff/nyxtheme.css;

  programs.vesktop = {
    enable = true;





    settings = {

      discordBranch = "stable";
      minimizeToTray = false;
      arRPC = false;
      splashBackground = "#00000000";
      splashColor = "#00000000";
    };





    # vencord.settings = {
    #   enabledThemes = [
    #     "nyxtheme.css"
    #   ];
    #   useQuickCss = false;
    #   transparent = true;
    #   frameless = false;
    #   winCtrlQ = true;
    #   appBadge = false;
    #   arRPC = false;
    #   checkUpdates = false;
    #   autoUpdate = false;
    #   autoUpdateNotification = false;
    #   customTitleBar = false;
    #   disableMinSize = true;
    #   minimizeToTray = false;
    #   tray = false;
    #   enableSplashScreen = false;
    #   splashBackground = "#00000000";
    #   splashColor = "#00000000";
    #   splashTheming = false;
    #   staticTitle = true;
    #   hardwareAcceleration = true;
    #   discordBranch = "stable";
    #   spellCheckLanguages = false;
    #
    #   notifications = {
    #     enable = false;
    #     timeout = 5000;
    #     position = "bottom-right";
    #     useNative = false;
    #     logLimit = 50;
    #   };
    #
    #   plugins = {
    #     ChatInputButtonAPI.enabled = true;
    #     CommandsAPI.enabled = true;
    #     DynamicImageModalAPI.enabled = true;
    #
    #
    #
    #
    #
    #
    #     MessageAccessoriesAPI.enabled = true;
    #     MessageEventsAPI.enabled = true;
    #     MessagePopoverAPI.enabled = true;
    #     MessageUpdaterAPI.enabled = true;
    #     UserSettingsAPI.enabled = true;
    #     AlwaysTrust = {
    #       enabled = true;
    #       domain = true;
    #       file = true;
    #     };
    #     BetterFolders = {
    #       enabled = true;
    #       sidebar = false;
    #       showFolderIcon = 1;
    #       keepIcons = false;
    #       closeAllHomeButton = true;
    #       closeAllFolders = true;
    #       forceOpen = false;
    #       sidebarAnim = false;
    #       closeOthers = true;
    #     };
    #     BetterGifPicker.enabled = true;
    #     BetterSettings = {
    #       enabled = true;
    #       disableFade = true;
    #       eagerLoad = true;
    #     };
    #     BiggerStreamPreview.enabled = true;
    #     BlurNSFW = {
    #       enabled = true;
    #       blurAmount = 10;
    #     };
    #     CallTimer.enabled = true;
    #     ClearURLs.enabled = true;
    #     CopyUserURLs.enabled = true;
    #     CrashHandler.enabled = true;
    #     DisableCallIdle.enabled = true;
    #     EmoteCloner.enabled = true;
    #     FakeNitro = {
    #       enabled = true;
    #       enableEmojiBypass = false;
    #       emojiSize = 48;
    #       transformEmojis = true;
    #       enableStickerBypass = false;
    #       stickerSize = 160;
    #       transformStickers = true;
    #       transformCompoundSentence = false;
    #       enableStreamQualityBypass = true;
    #       useHyperLinks = true;
    #       hyperLinkText = "{{NAME}}";
    #       disableEmbedPermissionCheck = false;
    #     };
    #     FavoriteGifSearch.enabled = true;
    #     FixCodeblockGap.enabled = true;
    #     FixImagesQuality.enabled = true;
    #     FixSpotifyEmbeds.enabled = true;
    #     FixYoutubeEmbeds.enabled = true;
    #     FriendsSince.enabled = true;
    #     ImageZoom = {
    #       enabled = true;
    #       size = 400;
    #       zoom = 3.8000000000000003;
    #       nearestNeighbour = false;
    #       square = false;
    #       saveZoomValues = true;
    #       invertScroll = true;
    #       zoomSpeed = 0.5;
    #     };
    #     LoadingQuotes = {
    #       enabled = true;
    #       replaceEvents = true;
    #       enablePluginPresetQuotes = true;
    #       enableDiscordPresetQuotes = false;
    #       additionalQuotes = "";
    #       additionalQuotesDelimiter = "|";
    #     };
    #     MemberCount = {
    #       enabled = true;
    #       memberList = true;
    #       toolTip = true;
    #     };
    #     MessageLatency = {
    #       enabled = true;
    #       latency = 5;
    #       detectDiscordKotlin = true;
    #       showMillis = false;
    #     };
    #     MessageLinkEmbeds.enabled = true;
    #     MessageLogger = {
    #       enabled = true;
    #       deleteStyle = "text";
    #       logDeletes = true;
    #       collapseDeleted = false;
    #       logEdits = true;
    #       inlineEdits = true;
    #       ignoreBots = true;
    #       ignoreSelf = false;
    #       ignoreUsers = "";
    #       ignoreChannels = "";
    #       ignoreGuilds = "";
    #     };
    #     NoOnboardingDelay.enabled = true;
    #     NoServerEmojis = {
    #       enabled = true;
    #       shownEmojis = "currentServer";
    #     };
    #     NoTypingAnimation.enabled = true;
    #     NoUnblockToJump.enabled = true;
    #     NotificationVolume = {
    #       enabled = true;
    #       notificationVolume = 100;
    #     };
    #     OpenInApp = {
    #       enabled = true;
    #       spotify = false;
    #       steam = true;
    #       epic = true;
    #       tidal = false;
    #       itunes = false;
    #     };
    #     PlainFolderIcon.enabled = true;
    #     ShowTimeoutDuration.enabled = true;
    #     SilentTyping = {
    #       enabled = true;
    #       showIcon = false;
    #       contextMenu = true;
    #       isEnabled = true;
    #     };
    #     SortFriendRequests = {
    #       enabled = true;
    #       showDates = false;
    #     };
    #     SpotifyCrack = {
    #       enabled = true;
    #       noSpotifyAutoPause = true;
    #       keepSpotifyActivityOnIdle = false;
    #     };
    #     TypingIndicator = {
    #       enabled = true;
    #       includeMutedChannels = false;
    #       includeCurrentChannel = true;
    #       indicatorMode = 3;
    #     };
    #     TypingTweaks = {
    #       enabled = true;
    #       alternativeFormatting = true;
    #       showRoleColors = true;
    #       showAvatars = true;
    #     };
    #     Unindent.enabled = true;
    #     UnlockedAvatarZoom.enabled = true;
    #     UserMessagesPronouns = {
    #       enabled = true;
    #       pronounsFormat = "LOWERCASE";
    #       showSelf = false;
    #     };
    #     USRBG = {
    #       enabled = true;
    #       voiceBackground = true;
    #     };
    #     ValidReply.enabled = true;
    #     ValidUser.enabled = true;
    #     ViewIcons.enabled = true;
    #     ViewRaw = {
    #       enabled = true;
    #       clickMethod = "Left";
    #     };
    #     WebKeybinds.enabled = true;
    #     WebScreenShareFixes.enabled = true;
    #     YoutubeAdblock.enabled = true;
    #     BadgeAPI.enabled = true;
    #     NoTrack = {
    #       enabled = true;
    #       disableAnalytics = true;
    #     };
    #     Settings = {
    #       enabled = true;
    #       settingsLocation = "aboveNitro";
    #     };
    #     DisableDeepLinks.enabled = true;
    #     SupportHelper.enabled = true;
    #     WebContextMenus.enabled = true;
    #   };
    # };

  };
}
