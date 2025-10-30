{
  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CACHE_HOME = "$HOME/.cache";

    CALCHISTFILE = "$XDG_CACHE_HOME/calc_history";
    CARGO_HOME = "$HOME/.local/share/cargo";
    DOCKER_CONFIG = "$XDG_CONFIG_HOME/docker";
    GNUPGHOME = "$XDG_DATA_HOME/gnupg";
    GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc";
    GTK_RC_FILES = "$XDG_CONFIG_HOME/gtk-1.0/gtkrc";
    KDEHOME = "$XDG_CONFIG_HOME/kde";
    NODE_REPL_HISTORY = "$XDG_DATA_HOME/node_repl_history";
    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
    PYTHONHISTORY = "$XDG_DATA_HOME/python_history";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
    WGETRC = "$XDG_CONFIG_HOME/wgetrc";
    WINEPREFIX = "$XDG_DATA_HOME/wineprefixes/default";
    XINITRC = "$XDG_CONFIG_HOME/X11/xinitrc";
    ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    ZSH_DATA_PATH = "$XDG_DATA_HOME/zsh";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
    GOPATH = "$HOME/.local/share/go";
    GOMODCACHE = "$HOME/.local/share/go/mod";
  };
}
