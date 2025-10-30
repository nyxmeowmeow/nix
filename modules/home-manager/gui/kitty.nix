{
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    # font.name = config.stylix.fonts.monospace.name;
    # font.size = 22;
  };
}
