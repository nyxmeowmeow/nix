{ os_config, lib, theme, ... }:
let
  theme_trimmed = lib.strings.removeSuffix "_zen" theme;
  col = import ../../../../theme/${theme_trimmed}/colors.nix;
in {
  home.file.".config/usercontent/nixos.css".text = /* css */ ''
@-moz-document domain("wiki.nixos.org") {
* {
  font-family: ${os_config.font_path} !important;
  background: transparent !important;
}

:root {
	--font-size-medium: 20px !important;
  --color-base: ${col.fg} !important;
  --color-emphasized: ${col.fg} !important;
  --color-progressive: ${col.blue} !important;
  --color-visited: ${col.purple} !important;
}

.vector-sticky-pinned-container::after { /* white gradient thing */
  display: none !important;
}

}
  '';
}
