{
  programs.git = {
    enable = true;
    userName = "nyxmeowmeow";
    userEmail = "rraaiin@proton.me";
    extraConfig = {
      url = {
        "git@github.com:" = {
          insteadOf = "gh:";
        };
        "git@github.com:nyxmeowmeow/" = {
          insteadOf = "me:";
        };
      };
    };
  };
}
