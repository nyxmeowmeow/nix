{ lib, theme, ... }: {
  config = lib.mkIf (lib.hasPrefix "kanso" theme) {





  };
}
