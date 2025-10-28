{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.theme == "kantsi") {
    config.palette = {
      accent = "#7fb4ca";
      bg = "#000000";
      bgtrans = "#000000cc";
      fg = "#C5C9C7";
    };
  };
}
