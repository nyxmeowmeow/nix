{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gnome-online-accounts
    gnome-control-center

    quickshell

    # bash-completion
    # nix-bash-completions
    expect

    # gimp
    krita

    olympus
    osu-lazer
    tt # typing
    vitetris
    cl-wordle

    ffmpeg
    # davinci-resolve
    vulkan-tools

    coreutils
    moreutils
    trash-cli
    file
    zip
    unzip
    rar
    unrar

    btop
    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils
    nushell

    termdown
    tty-clock

    # qview
    mpc
    # nix-inspect
    mpv
    obs-studio
    # fuse
    libevdev
    libqalculate
    gh
    netcat
    jq
    wl-clipboard
    ripgrep
    fd
    eza
    fzf
    zoxide
    walker
    udiskie
    udisks2
    gvfs
    wget
    git
    dbus
    vesktop
    polkit_gnome
    # grimblast
    # slurp
    dunst
    libnotify
    playerctl
    yazi
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
