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
  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_CONFIG_HOME = "${h}/.config";
    XDG_DATA_HOME = "${h}/.local/share";
    XDG_CACHE_HOME = "${h}/.cache";

    CALCHISTFILE = "${cache}/calc_history";
    CARGO_HOME = "${data}/cargo";
    DOCKER_CONFIG = "${cfg}/docker";
    GNUPGHOME = "${data}/gnupg";
    GTK2_RC_FILES = "${cfg}/gtk-2.0/gtkrc";
    GTK_RC_FILES = "${cfg}/gtk-1.0/gtkrc";
    KDEHOME = "${cfg}/kde";
    NODE_REPL_HISTORY = "${data}/node_repl_history";
    NPM_CONFIG_USERCONFIG = "${cfg}/npm/npmrc";
    PYTHONHISTORY = "${data}/python_history";
    RUSTUP_HOME = "${data}/rustup";
    WGETRC = "${cfg}/wgetrc";
    WINEPREFIX = "${data}/wineprefixes/default";
    XINITRC = "${cfg}/X11/xinitrc";
    ZDOTDIR = "${cfg}/zsh";
    ZSH_DATA_PATH = "${data}/zsh";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${cfg}/java";
    GOPATH = "${data}/go";
    GOMODCACHE = "${data}/go/mod";


    DESKTOP = "/tmp/desktop";
    DOCUMENTS = "${h}/doc";
    DOWNLOAD = "${h}/dl";
    MUSIC = "${h}/music";
    PICTURES = "${h}/pic";
    VIDEOS = "${h}/vid";

  };

  environment.variables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_CONFIG_HOME = "${h}/.config";
    XDG_DATA_HOME = "${h}/.local/share";
    XDG_CACHE_HOME = "${h}/.cache";

    CALCHISTFILE = "${cache}/calc_history";
    CARGO_HOME = "${data}/cargo";
    DOCKER_CONFIG = "${cfg}/docker";
    GNUPGHOME = "${data}/gnupg";
    GTK2_RC_FILES = "${cfg}/gtk-2.0/gtkrc";
    GTK_RC_FILES = "${cfg}/gtk-1.0/gtkrc";
    KDEHOME = "${cfg}/kde";
    NODE_REPL_HISTORY = "${data}/node_repl_history";
    NPM_CONFIG_USERCONFIG = "${cfg}/npm/npmrc";
    PYTHONHISTORY = "${data}/python_history";
    RUSTUP_HOME = "${data}/rustup";
    WGETRC = "${cfg}/wgetrc";
    WINEPREFIX = "${data}/wineprefixes/default";
    XINITRC = "${cfg}/X11/xinitrc";
    ZDOTDIR = "${cfg}/zsh";
    ZSH_DATA_PATH = "${data}/zsh";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${cfg}/java";
    GOPATH = "${data}/go";
    GOMODCACHE = "${data}/go/mod";


    DESKTOP = "/tmp/desktop";
    DOCUMENTS = "${h}/doc";
    DOWNLOAD = "${h}/dl";
    MUSIC = "${h}/music";
    PICTURES = "${h}/pic";
    VIDEOS = "${h}/vid";

  };
}
