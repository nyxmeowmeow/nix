final: prev: {
  ncmpcpp = prev.ncmpcpp.override {
    outputsSupport = false;
    visualizerSupport = false;
    clockSupport = false;
    taglibSupport = false;
  };
}
