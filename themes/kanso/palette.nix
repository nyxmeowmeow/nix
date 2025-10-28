{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.theme == "kanso_mist" || config.theme == "kanso_ink" || config.theme == "kanso_zen") {
    config.palette = {
      accent = "#7fb4ca";
      bg = "#090e13";
      bgtrans = "#090e13cc";
      fg = "#C5C9C7";
    };
  };
}
