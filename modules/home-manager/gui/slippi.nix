{ inputs, outputs, ... }: {
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

}
