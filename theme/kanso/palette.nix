{
  lib,
  config,
  ...
}: {
  config = lib.mkIf (lib.hasPrefix "kanso" config.theme) {
    config.palette = {
      accent = "#7fb4ca";
      bg = "#090e13";
      bgtrans = "#090e13cc";
      fg = "#C5C9C7";
    };
  };
}
