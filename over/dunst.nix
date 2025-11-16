final: prev: {
  dunst = prev.dunst.override {
    withX11 = false;
  };
}
