final: prev: {
   obs-studio= prev.obs-studio.override {
    alsaSupport = false;
    pulseaudioSupport = false;
    pipewireSupport = true;
    # browserSupport = true;

    cmakeFlags = [
    ];
  };
}
