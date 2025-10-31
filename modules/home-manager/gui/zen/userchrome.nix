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

  programs.zen-browser.profiles."meow".userChrome = /* css */ ''
*{
  font-size: 16px;
  font-family: ${config.stylix.fonts.monospace.name} Bold;

  scrollbar-width: none;
  box-shadow: none;
}

.tab-close-button,
.urlbar-page-action, .urlbar-addon-page-action,
#back-button,
#tab-reset-button,
#forward-button {
  display: none !important;
}


.urlbar-background,
#browser,
#navigator-toolbox,
#nav-bar,
#zen-browser-background,
#zen-appcontent-navbar-wrapper,
#zen-main-app-wrapper {
      background: transparent !important;
}
#main-window {
  background: ${col.bgtrans} !important;
}


:root {
  --zen-primary-color: transparent !important;
  /* --zen-border-radius: 8px; */
  /* --zen-element-separation: 8px; */
  /* --zen-background-opacity: 1; */
  /* --zen-grainy-background-opacity: 0; */
  /* --toolbox-textcolor: transparent !important; */
  --zen-main-browser-background: transparent !important;
  --zen-main-browser-background-old: transparent !important;
  --zen-main-browser-background-toolbar: transparent !important;
  --zen-main-browser-background-toolbar-old: transparent !important;
}


.tab-content {
  &:is([selected], [multiselected]) {
    color: ${col.bg} !important;
    background: ${col.accent} !important;
  }
}










#zen-appcontent-wrapper {
  padding-bottom: 28px !important;
  padding-left: 0px !important;
  padding-right: 0px !important;
  padding-top: 0px !important;
}

#zen-appcontent-navbar-container {
  z-index: 999999 !important;
  position: absolute;
  bottom: 0 !important;
  background: transparent !important;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding-top: 0px;
  width: 100%;
  min-height: 36px;
}

#nav-bar {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: calc(100% - 184px);
  /* width: calc(100% - var(--sidebar-width)); */
}

:root:not([inDOMFullscreen="true"]):not([chromehidden~="location"]):not([chromehidden~="toolbar"]) {
  & #tabbrowser-tabpanels {
    padding-right: 0 !important;
    padding-bottom: var(--zen-element-separation);
  }
}

.urlbar > .urlbar-input-container > .urlbar-input-box > .urlbar-input {
  mask-image: none;
}
.urlbar-input {
  text-align: right !important;
}
#PanelUI-menu-button {
  position: absolute;
  bottom: 5px;
  left: -60px;
}
.identity-box-button {
  position: absolute;
  bottom: 5px;
  /* left: -80px; */
}
#zen-sidebar-top-buttons {
  & #zen-sidebar-top-buttons-customization-target {
    display: none !important;
  }
}
#navigator-toolbox[zen-sidebar-expanded="true"] {
  margin-top: -33px !important;
}


:root:not([inDOMFullscreen="true"]):not([chromehidden~="location"]):not([chromehidden~="toolbar"]) {
  & #tabbrowser-tabbox #tabbrowser-tabpanels .browserSidebarContainer, & #tabbrowser-tabpanels[dragging-split="true"] {
    &.browserSidebarContainer {
      & browser[type="content"] {
        &[transparent="true"] {
          background: transparent !important;
        }
      }
    }
  }
}


.tab-background {
    min-height: 28px !important;
}


.urlbar-input {
  margin-right: 30px !important;
}


  '';
}
