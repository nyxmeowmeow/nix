{
  programs.git = {
    enable = true;
    userName = "nyx-meow";
    userEmail = "rraaiin@proton.me";
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "gh:";
        };
        "git@github.com:nyx-meow/" = {
          insteadOf = "me:";
        };
      };
    };
  };
}
