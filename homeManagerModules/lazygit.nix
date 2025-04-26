{ ... }: {
  programs.lazygit = {
    enable = true;

    settings = {
      activeBorderColor = [ "blue" ];
      inactiveBorderColor = [ "default" ];

    };

  };

}
