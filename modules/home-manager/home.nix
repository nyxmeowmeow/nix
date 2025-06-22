{ config, ... }: {

  home-manager = {
    extraSpecialArgs = {
      theme = config.theme;
    };
    users.meow = {


      home.username = "meow";
      lib.mkForce = {
        home.homeDirectory = "/home/meow";
      };
      home.stateVersion = "24.11";





    };
  };
}
