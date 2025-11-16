{
  flake_dir,
  ...
}: {
  programs.nh = {
    enable = true;
    flake = flake_dir;
  };
}
