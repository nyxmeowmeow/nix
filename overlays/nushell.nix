self: super: {
  nushell = super.nushell.overrideAttrs (old: {
    RUSTFLAGS = "-C opt-level=3 -C target-cpu=native -C lto=yes";
  });
}
