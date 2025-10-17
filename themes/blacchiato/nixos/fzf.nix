{ lib, config, ... }: {
  config = lib.mkIf (config.theme == "blacchiato") {
    environment.variables = {
      # FZF_DEFAULT_OPTS = "--color=fg:#cad3f5,hl:#8bd5ca,fg+:#000000,bg+:#b7bdf8,hl+:#8bd5ca,info:#7f8c8d,prompt:#b7bdf8,spinner:-1,pointer:#b7bdf8,gutter:-1,info:#939ab7,border:-1 --border=none --info=hidden --header='' --prompt='󰘧 ' --no-bold -i --pointer=''";
    };
  };
}
