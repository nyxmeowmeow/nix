self: super: {
  luajit = super.luajit.overrideAttrs (old: {
    NIX_CFLAGS_COMPILE = "-O3 -march=native -pipe -flto";
  });
}
