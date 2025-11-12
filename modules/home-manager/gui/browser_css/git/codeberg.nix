{
  config,
  lib,
  theme,
  ...
}:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/codeberg.css".text = /* css */ ''
@-moz-document domain("codeberg.org") {
* {
  font-family: ${config.stylix.fonts.monospace.name} !important;
  border-color: transparent !important;
}

:root {
  --color-text: ${col.fg} !important;
  --color-body: transparent !important;
  --color-secondary-nav-bg: transparent !important;
  --color-text-light-2: ${col.grey} !important;
  --color-button: ${col.button} !important;
  --color-box-body: transparent !important;
  --color-input-background: ${col.button} !important;
  --color-secondary-light-1: transparent !important;
  --color-box-header: transparent !important;
  --color-hover: ${col.button_hover} !important;
  --color-secondary-dark-1: transparent !important;
  --color-primary-hover: ${col.accent} !important;
  --color-primary: ${col.accent} !important;
}

#navbar,
.tw-bg-box-header {
  background: transparent !important;
}

#navbar .navbar-left {
  display: none !important;
}
#navbar .navbar-right {
  position: absolute !important;
  right: 0px !important;
}

.repository .repository-summary #language-stats-bar {
  border-top-left-radius: 99px !important;
  border-top-right-radius: 99px !important;
  border-bottom-left-radius: 99px !important;
  border-bottom-right-radius: 99px !important;
}

.tw-border-secondary,
.ui.table {
  border: none;
}


'';
}
