self: super: {
  luajit = super.luajit.overrideAttrs (old: {
    env = (old.env or {}) // {
      CFLAGS = "-O3 -march=native -pipe";
    };
  });
}
