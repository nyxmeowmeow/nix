self: super: {
  neovim = super.neovim.overrideAttrs (old: {
    # Add CFLAGS for C compiler via cmake
    cmakeFlags = (old.cmakeFlags or []) ++ [
      "-DCMAKE_C_FLAGS=-Ofast -march=native -pipe"
      "-DCMAKE_CXX_FLAGS=-Ofast -march=native -pipe"
    ];
  });
}
