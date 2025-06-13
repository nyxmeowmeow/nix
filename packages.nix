{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    emacs-pgtk

    # bash-completion
    # nix-bash-completions
    expect


    socat
    # wev
    # lutris
    # gimp
    krita
    # osu-lazer

    tt # typing
    vitetris
    cl-wordle

    ffmpeg
    # davinci-resolve
    vulkan-tools
    trash-cli
    tldr
    btop
    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils
    nushell
    # godot



    unzip

    termdown
    tty-clock

    qview
    mpc
    ripgrep
    # nix-inspect
    mpv
    obs-studio
    fuse
    libevdev
    libqalculate
    gh
    netcat
    jq
    wl-clipboard
    clipse
    eza
    fzf
    zoxide
    waybar
    walker
    udiskie
    udisks2
    gvfs
    wget
    git
    dbus
    # firefox
    vesktop
    foot
    hyprprop
    hyprland
    hyprpaper
    hyprpicker
    polkit_gnome
    grimblast
    slurp
    # catppuccin-kvantum
    # catppuccin-gtk
    dunst
    libnotify
    playerctl
    yazi
    #neovim
    stylua
    fastfetch
    kanata
    dconf
    mesa
    libGL
    libdrm
    xwayland
    wine
    wine64
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.iosevka
    sn-pro
  ];
}
