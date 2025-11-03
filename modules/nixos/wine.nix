{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wine
    wine64
    mono

    (pkgs.bottles.override {
      removeWarningPopup = true;
    })
    # lutris
  ];
}
