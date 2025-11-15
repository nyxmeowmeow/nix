{
  username,
  ...
}:
let
  h = "/home/${username}";

  cfg = "${h}/.config";
  data = "${h}/.local/share";
  cache = "${h}/.cache";
in {
  home.file."${cfg}/npm/npmrc".text = ''
prefix=${cfg}/npm
cache=${cfg}/npm
init-module=${cfg}/npm/config/npm-init.js
logs-dir=${cfg}/npm/logs
  '';
}
