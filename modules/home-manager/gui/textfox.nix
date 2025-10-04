{ inputs, pkgs, ... }: {
  imports = [ inputs.textfox.homeManagerModules.default ];

  programs.firefox.enable = true;
  programs.firefox.nativeMessagingHosts = [ pkgs.tridactyl-native ];

  textfox = {
    enable = true;
    profile = "meow";
    config = {
      background = {
        color = "#090E13";
      };
      border = {
        color = "#7FB4CA";
        width = "3px";
        transition = "1.0s ease";
        radius = "3px";
      };
      displayHorizontalTabs = true;
      displayWindowControls = false;
      displayNavButtons = false;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = true;
      newtabLogo = "   __            __  ____          \A   / /____  _  __/ /_/ __/___  _  __\A  / __/ _ \\| |/_/ __/ /_/ __ \\| |/_/\A / /_/  __/>  </ /_/ __/ /_/ />  <  \A \\__/\\___/_/|_|\\__/_/  \\____/_/|_|  ";
      font = { 
        family = "Iosevka Nerd Font Mono";
        size = "22px";
        accent = "#7FB4CA";
      };
      sidebery = {
        margin = "1.0rem";
      };
    };
  };
}
