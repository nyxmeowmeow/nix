{ lib, config, theme, ... }:
let
  col = import ../colors.nix;
in {
  config = lib.mkIf (theme == "kanso_mist" || theme == "kanso_ink" || theme == "kanso_zen") {

    environment.variables = {
      FZF_DEFAULT_OPTS = "--color=fg:${col.fg},hl:${col.blue},fg+:#24273a,bg+:${col.blue},hl+:#8bd5ca,info:#7f8c8d,prompt:${col.blue},spinner:-1,pointer:${col.blue},gutter:-1,info:#939ab7,border:-1 --border=none --info=hidden --header='' --prompt='󰘧 ' --no-bold -i --pointer=''";
    };
  };
}
