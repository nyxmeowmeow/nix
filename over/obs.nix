final: prev: {
   obs-studio = prev.obs-studio.override {
    alsaSupport = false;
    pulseaudioSupport = false;
    pipewireSupport = true;
    # browserSupport = true;
  } ++ prev.neovim.overrideAttrs (old: {
    cmakeFlags = [
      "-DCMAKE_C_FLAGS=-O3 -march=native -pipe"
      "-DCMAKE_CXX_FLAGS=-O3 -march=native -pipe"
    ];
  });
}
