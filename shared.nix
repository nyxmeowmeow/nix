{ config, ... }: {

  mrrp.theme = "lix";


  home-manager.users.meow = {
    import = [ ./home.nix ];
    extraSpecialArgs = {
      systemTheme = config.mrrp.theme;
    };
  };
                 }
