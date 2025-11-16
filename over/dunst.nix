final: prev: {
  neovim = prev.neovim.override {
    withX11 = false;
  };
}
