{
  programs.niri.settings.layer-rules = [
  {
    matches = [ { namespace = "^quickshell$"; } ];
    place-within-backdrop = true;
  }
  {
    matches = [ { } ]; # matches all layers
    place-within-backdrop = true;
  }
  ];
}
