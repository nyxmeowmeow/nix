self: super: {
  neovim = super.neovim.overrideAttrs (old: {
    cmakeFlags = (old.cmakeFlags or []) ++ [
      "-DCMAKE_C_FLAGS=-O3 -march=native -pipe"
      "-DCMAKE_CXX_FLAGS=-O3 -march=native -pipe"
    ];
  });
}
