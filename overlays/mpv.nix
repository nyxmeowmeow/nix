self: super: {
  mpv = super.mpv.overrideAttrs (old: {
    mesonBuildFlags = [
      "-Dc_args=-O3 -march=native -pipe"
    ];

    waylandSupport = true;
    x11Support = false;
    sixelSupport = false;
    bluraySupport = false;
    pipewireSupport = true;
    alsaSupport = false;
    pulseSupport = false;
    jackaudioSupport = false;
  });
}
