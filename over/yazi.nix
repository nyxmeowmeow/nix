self: super: {
  yazi = super.yazi.overrideAttrs (old: {
    CARGO_PROFILE_RELEASE_LTO = "true";
    CARGO_PROFILE_RELEASE_OPT_LEVEL = "3";
    CARGO_PROFILE_RELEASE_CODEGEN_UNITS = "1";
    RUSTFLAGS = "-C target-cpu=native";
  });
}
