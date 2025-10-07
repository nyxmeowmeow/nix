self: super: {
  mpv = super.mpv.overrideAttrs (old: {
    mesonBuildFlags = [
      "-Dc_args=-O3 -march=native -pipe"
    ];

    waylandSupport = false;
    x11Support = true;
    sixelSupport = false;
    bluraySupport = false;
    pipewireSupport = true;
    alsaSupport = false;
    pulseSupport = false;
    jackaudioSupport = false;
  });
}
