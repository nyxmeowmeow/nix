self: super: {
  foot = super.foot.overrideAttrs (old: {
    mesonBuildFlags = [
      "-Dc_args=-O3 -march=native -pipe"
    ];
  });
}
