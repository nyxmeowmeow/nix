{ inputs, outputs, pkgs, ... }: {
  home-manager.users.meow = {
    imports = with outputs.homeManagerModules; [
      slippi.homeManagerModules.default
      {
        slippi-launcher = {
        isoPath = "/home/meow/melee/meow.iso";
        launchMeleeOnPlay = false;
        };
      }
    ];
  };

  programs.appimage = {
    enable = true;
    binfmt = true;

    # This is needed for Slippi to run.
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.curl
        pkgs.libmpg123
      ];
    };
  };
}
