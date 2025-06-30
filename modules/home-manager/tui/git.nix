{
  programs.git = {
    enable = true;
    userName = "rainmeower";
    userEmail = "rraaiin@proton.me";
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "gh:";
        };
        "git@github.com:rainmeower/" = {
          insteadOf = "me:";
        };
      };
    };
  };
}
