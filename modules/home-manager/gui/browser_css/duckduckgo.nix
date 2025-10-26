{ config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../themes/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/duckduckgo.css".text = /* css */ ''
@-moz-document domain("duckduckgo.com") {
* { font-family: ${config.stylix.fonts.monospace.name} !important; }

html, body, .body--home, .site-wrapper, .region__body, .badge-link, .module--carousel__image-wrapper, .result__image, .vertical--map__sidebar, .vertical--map__sidebar__header, .page-chrome_newtab, .zci--type--tiles:not(.is-fallback).is-full-page.is-expanded, .zci--type--tiles:not(.is-fallback).is-full-page.is-expanded .metabar:not(.is-stuck), .is-link-style-exp .header-wrap  {
  background-color: transparent !important;
}

:root {
  --font: ${config.stylix.fonts.monospace.name} !important;
  --theme-col-txt-snippet: ${col.fg} !important;
  --theme-col-txt-title-visited: ${col.purple} !important;
  --theme-col-txt-title: ${col.blue} !important;

  --sds-color-text-accent-01: ${col.blue} !important;
  --sds-color-text-background-01: ${col.gray} !important;
  --sds-color-text-link-02-hover: ${col.gray} !important;

  --theme-col-txt-card-body: ${col.gray} !important;
}

.header--aside__item, .TccjmKV6RraCaCw5L9gd  {
  display: none !important;
}
.jyBaPv1HPGOoWrXSAjiu .T265XEcezvjUhK71U8pN {
  box-shadow: none !important;
}
._2iQrmxmcSVuOHpCus2L._2iQrmxmcSVuOHpCus2L {
  background-color: transparent !important;
}
.header-wrap {
  background-color: transparent !important;
  box-shadow: none !important;
}

  }
  '';
}
