{
  lib,
  theme,
  config,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {

  programs.firefox.profiles."meow".userChrome = /* css */ ''
* {
  font-size: 16px;
  font-family: ${config.stylix.fonts.monospace.name} Bold;
  scrollbar-width: none;
}


:root {
  --tab-selected-bgcolor: transparent !important;
  --tab-selected-shadow: none !important;
  --content-area-shadow: none !important;
}

#navigator-toolbox,
#sidebar-main {
  background-color: transparent !important;
}
#navigator-toolbox-background {
  appearance: none !important;
}
#main-window {
  background: ${col.bgtrans} !important;
}

#nav-bar {
  border-top-color: transparent !important;
}
#tabbrowser-tabpanels, #browser {
  background: transparent !important;
}
#tabbrowser-tabbox {
  outline: none !important;
}







:root {
  --color-accent-primary: ${col.accent} !important;

  --tab-selected-bgcolor: ${col.accent} !important;
  --tab-selected-textcolor: ${col.bg} !important;
  --tab-selected-shadow: transparent !important;

  /* --button-text-color */
  /* --button-background-color */
  /* --button-background-color-hover */
  /* --button-background-color-active */


  --toolbox-bgcolor: transparent !important;
  --toolbox-bgcolor-inactive: transparent !important;
  --toolbox-textcolor: ${col.fg} !important;
  --toolbox-textcolor-inactive: ${col.fg} !important;

  --sidebar-background-color: transparent !important;
  --sidebar-text-color: ${col.fg} !important;
  /* --sidebar-border-color: -moz-sidebarborder; */


}





 .tabbrowser-tab {
    padding-left: 0px !important;
    padding-right: 0px !important;
    padding-top: 0px !important;
    padding-bottom: 0px !important;
    left: 0px !important;
}


.urlbar-searchmode-switcher, .searchmode-switcher, .chromeclass-toolbar-additional, .tools-and-extensions, .actions-list, .overflow-button, #sidebar-tools-and-extensions-splitter {
  display: none !important;
}




.urlbar:not([focused])[textoverflow="right"] > .urlbar-input-container > .urlbar-input-box > .urlbar-input {
  mask-image: none;
}
.urlbar-input {
  text-align: right !important;
}

/* :root, body, #browser, #browser:not(.browser-toolbox-background), #navigator-toolbox, #tabbrowser-tabs, .urlbar-background, #searchbar { */
/*   background-color: transparent !important; */
/*   background: transparent !important; */
/* } */

/* :root, body { */
/*   background-color: ${col.bgtrans} !important; */
/* } */



  #titlebar{ -moz-appearance: none !important; }

  #navigator-toolbox > div{ display: contents }
  .global-notificationbox,
  #mainPopupSet,
  #browser,
  #customization-container,
  #tab-notification-deck{
    order: -1;
  }
  #navigator-toolbox{ border-bottom: none !important; }

  #toolbar-menubar > spacer{ flex-grow: 1 }

  #urlbar[breakout][breakout-extend]{
    display: flex !important;
    flex-direction: column-reverse;
    bottom: 0px !important; /* Change to 3-5 px if using compact_urlbar_megabar.css depending on toolbar density */
    top: auto !important;
  }

  .urlbarView-body-inner{ border-top-style: none !important; }

  /* Yeah, removes window controls. Likely not wanted on bottom row  */
  #TabsToolbar > .titlebar-buttonbox-container{ display: none }
  #toolbar-menubar > .titlebar-buttonbox-container{ order: 1000 }

  /* Fix panels sizing */
  .panel-viewstack{ max-height: unset !important; }

  /* Fullscreen mode support */
  :root[sizemode="fullscreen"] #navigator-toolbox{ margin-top: 0 !important }
  :root[sizemode="fullscreen"] #navigator-toolbox[style*="margin-top"]{ visibility: collapse }
  #fullscr-toggler{ bottom: 0; top: unset !important; }
  
  /* These three rules exist for compatibility with autohide_toolbox.css */
  #navigator-toolbox{ bottom: 0px; transform-origin: bottom }
  #main-window > body > box{ margin-top: 0 !important; }
  #toolbar-menubar{ z-index: 1; background-color: var(--lwt-accent-color,black); }
  
  :root[BookmarksToolbarOverlapsBrowser] #navigator-toolbox{
    margin-block: calc(-1 * var(--bookmarks-toolbar-height)) 0 !important;
  }
  :root[BookmarksToolbarOverlapsBrowser] .newTabBrowserPanel{
    padding-block: 0 var(--bookmarks-toolbar-height) !important;
  }
  
  #titlebar{ flex-direction: column }


.urlbarView {
  position: absolute;
  bottom: var(--urlbar-container-height);
}





/* /* background color of pinned tabs in a normal state (not hovered/selected) */ */
/* .tabbrowser-tab[pinned] .tab-stack .tab-background { */
/* background-color: #22262D !important; */
/* } */
/* /* background color when hovering */ */
/* .tabbrowser-tab[pinned]:hover .tab-stack .tab-background{ */
/* background-color: #22262D !important; */
/* } */
/* /* background color when selected */ */
/* .tabbrowser-tab[pinned][selected="true"] .tab-stack .tab-background, */
/* .tabbrowser-tab[pinned][multiselected="true"] .tab-stack .tab-background { */
/* background-color: #7FB4CA !important; */
/* } */
/* /* background color when hovering and selected */ */
/* .tabbrowser-tab[pinned][selected="true"]:hover .tab-stack .tab-background, */
/* .tabbrowser-tab[pinned][multiselected="true"]:hover .tab-stack .tab-background{ */
/* background-color: #7FB4CA !important; */
/* } */


  '';
}
