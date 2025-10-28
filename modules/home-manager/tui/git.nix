{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name= "nyxmeowmeow";
        email = "rraaiin@proton.me";
      };
    };
    settings = {
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
