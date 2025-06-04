{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    bash-completion
    nix-bash-completions

    helix


    socat
    protontricks
    # wev
    lutris
    # gimp
    # osu-lazer
    go

    tt # typing
    vitetris
    cl-wordle

    ffmpeg
    # davinci-resolve
    # mesa-demos
    vulkan-tools
    clinfo
    trash-cli
    tldr
    btop
    google-chrome
    # zenity
    # xdg-desktop-portal-termfilechooser
    expect
    nushell
    # godot



    unzip
    termdown
    tty-clock
    qview
    mpc
    mpd
    ripgrep
    # nix-inspect
    mpv
    obs-studio
    python3
    fuse
    # nss
    # fuse3
    # openssl
    # patchelf
    # appimage-run
    libevdev
    libqalculate
    krita
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
    nautilus
    gcc
    wget
    git
    dbus
    # firefox
    vesktop
    foot
    hyprsunset
    hyprprop
    hyprland
    hyprpaper
    hyprpicker
    polkit_gnome
    walker
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
    nixd
    fastfetch
    kanata
    dconf
    mesa
    libGL
    libdrm
    xwayland
    wine
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.iosevka
    sn-pro
  ];
}
