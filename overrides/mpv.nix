{
    packageOverrides = pkgs: {
    mpv = pkgs.mpv.override {
      waylandSupport = true;
      x11Support = false;
      sixelSupport = false;
      alsaSupport = false;
      bluraySupport = false;
      pipewireSupport = true;
      alsaSupport = false;
      pulseSupport = false;
      jackaudioSupport = false;
    };
  };
}
