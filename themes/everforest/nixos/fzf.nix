{ lib, config, ... }: {
  config = lib.mkIf (config.theme == "everforest_hard" || config.theme == "everforest_medium" || config.theme == "everforest_soft") {
    environment.variables = {
      FZF_DEFAULT_OPTS = "--color=fg:#9DA9A0,hl:#8bd5ca,fg+:#333C43,bg+:#9DA9A0,hl+:#8bd5ca,info:#7f8c8d,prompt:#9DA9A0,spinner:-1,pointer:-1,gutter:-1,info:#939ab7,border:-1 --border=none --info=hidden --header='' --prompt='󰘧 ' --no-bold -i --pointer=''";
    };
  };
}
