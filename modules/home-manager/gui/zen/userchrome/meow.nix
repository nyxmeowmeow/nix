{ inputs, pkgs, ... }: {

  programs.zen-browser.profiles.meow.userChrome = ''
* { font-family: iosevka nerd font mono; }
/* remove annoying popup panel at top */
#zen-appcontent-navbar-wrapper {
  display: none;
}

/* background color of pinned tabs in a normal state (not hovered/selected) */
.tabbrowser-tab[pinned] .tab-stack .tab-background {
background-color: #22262D !important;
}
/* background color when hovering */
.tabbrowser-tab[pinned]:hover .tab-stack .tab-background{
background-color: #22262D !important;
}
/* background color when selected */
.tabbrowser-tab[pinned][selected="true"] .tab-stack .tab-background,
.tabbrowser-tab[pinned][multiselected="true"] .tab-stack .tab-background {
background-color: #7FB4CA !important;
}
/* background color when hovering and selected */
.tabbrowser-tab[pinned][selected="true"]:hover .tab-stack .tab-background,
.tabbrowser-tab[pinned][multiselected="true"]:hover .tab-stack .tab-background{
background-color: #7FB4CA !important;
}
.zen-essentials-container {
  &:not(:empty) {
    padding-top: 6px;
    padding-bottom: 4px;
  }
}

.tab-background {
  border-radius: var(--tab-border-radius);
  min-height: 32px !important;
}

.zen-current-workspace-indicator {
  display: none !important;
}




:root:not([inDOMFullscreen="true"]):not([chromehidden~="location"]):not([chromehidden~="toolbar"]) {
  & #tabbrowser-tabbox #tabbrowser-tabpanels .browserSidebarContainer {
    & browser[transparent="true"] {
      background: none !important;
    }
  }
}

#browser-toolbox-background {
  background: transparent !important;
}

#zen-main-app-wrapper {
  background: transparent !important;
}

#main-window {
  background: transparent !important;
}

#browser {
  background: #090E13cc !important;
}

#zen-current-workspace-indicator {
  display: none !important;
}




.menupopup-arrowscrollbox {
  background: #090E13cc !important;
}



body {
  background-color: #00000000 !important;
}

--in-content-page-background: #090E13cc !important;
--in-content-box-background: #090E13cc !important;






:root {
  --toolbar-color: #cad3f5 !important;
  --lwt-text-color: #cad3f5 !important;
  --sidebar-text-color: #cad3f5 !important;
  --sidebar-border-color: #cad3f5 !important;
  --newtab-text-primary-color: #cad3f5 !important;
  --lwt-text-color: #cad3f5 !important;
  --toolbar-field-color: #cad3f5 !important;
  --toolbar-field-focus-color: #cad3f5 !important;
  --toolbar-bgcolor: #cad3f5 !important;
  --urlbarView-highlight-color: #cad3f5 !important;
  --urlbar-box-bgcolor: #22262D !important;
}

#main-window {
  --lwt-text-color: #cad3f5 !important;
  --sidebar-text-color: #cad3f5!important;
  --sidebar-border-color: #cad3f5!important;
  --newtab-text-primary-color: #cad3f5!important;
  --lwt-text-color: #cad3f5!important;
  --toolbar-field-color: #cad3f5!important;

}







 :root { 
   /*--zen-colors-primary: #24273a !important; */
   /*--zen-primary-color: #24273a !important; */
   /*--zen-colors-secondary: #24273a !important; */
   /*--zen-colors-tertiary: #24273a !important; */
   /*--zen-colors-border: #24273a00 !important; */
   --zen-main-browser-background: #00000000 !important; 
   /* --zen-main-browser-background: #24273a80 !important;  */
   /*--zen-main-browser-background-toolbar: #24273a !important; */
   /*--zen-themed-toolbar-bg: #24273a !important; */
 } 















#page-action-buttons {
  display: none !important;
}



#tabbrowser-tabs .tab-close-button {
  display: none !important;
}

#tabs-newtab-button {
  display: none !important;
}

#tabbrowser-arrowscrollbox-periphery {
  display: none !important;
}

#tab-close-button .close-icon {
  display: none !important;
}

.tab-close-button {
  display: none !important;
}

.tab-label {
  font-family: iosevka nerd font mono;
}

#urlbar-background {
  background: #22262D !important;
}

#identity-icon-box {
  visibility: hidden;
  width: 8px !important;
}

#back-button {
  display: none;
}

#forward-button {
  display: none;
}

/*#unified-extensions-button {*/
  /*display: none;*/
/*}*/

#preferences-button {
  display: none;
}

#downloads-button {
  position: absolute;
  right: 7px;
}

#identity-permission-box {
  display: none !important;
}

*{ scrollbar-width: none }




/* remove line divider thing between pinned tabs and normal tabs */
#vertical-pinned-tabs-container::after {
    bottom: 200px !important;
}







#tabbrowser-tabpanels {
    padding: 0px!important;
}

:root:not([inDOMFullscreen='true']) #tabbrowser-tabbox {
  padding: 0px!important; /* To allow the web view's shadow to be visible */
}



.zen-essentials-container {
	grid-template-columns: repeat(auto-fit, minmax(80px, auto)) !important;
}

.zen-essentials-container
	> tab
	> stack:nth-child(1)
	> hbox:nth-child(2)
	> stack:nth-child(2) {
		padding: 10px !important;
	}

.zen-essentials-container
	> tab
	> stack:nth-child(1)
	> hbox:nth-child(2)
	> stack:nth-child(2)
	> img:nth-child(3) {
		height: 24px !important;
		width: 24px !important;
	}



      #tabbrowser-tabpanels{
        --zen-webview-border-radius: 0;
      }
      #tabbrowser-tabpanels:not([zen-split-view="true"]){
        --zen-webview-border-radius: 0;
      }
      #tabbrowser-tabpanels[zen-split-view="true"]{
        --zen-webview-border-radius: 0;
      }
    hbox.browserSidebarContainer:not([zen-split="true"]){
      margin: 0 !important;
    }
      tabbox#tabbrowser-tabbox{
        --zen-split-row-gap: 0 !important;
        --zen-split-column-gap: 0 !important;
      }






      #zen-appcontent-wrapper:has(      
      > #zen-tabbox-wrapper 
      > #tabbrowser-tabbox      
      > #tabbrowser-tabpanels[zen-split-view="true"]){
        margin: 0 !important;
        & > #zen-tabbox-wrapper {
          margin: 0 !important;
        }
      }








      hbox.browserSidebarContainer{
        box-shadow: none !important;
      }







'';
}
