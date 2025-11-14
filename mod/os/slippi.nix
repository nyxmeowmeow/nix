{
  inputs,
  username,
  pkgs,
  ...
}: {
  home-manager = {
    users.${username} = {
      imports = [
        inputs.slippi.homeManagerModules.default
        {
          slippi-launcher = {
            isoPath = "/home/${username}/melee/meow.iso";
            rootSlpPath = "/home/${username}/.local/share/Slippi";
            spectateSlpPath = "/home/${username}/.local/share/Slippi/Spectate";
            launchMeleeOnPlay = false;
            enableJukebox = false;
            useMonthlySubfolders = true; # for replays
          };
        }
      ];
    };
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
