{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    thunderbird
    btop
    gimp
    google-chrome
    # zenity
    # xdg-desktop-portal-termfilechooser
    expect
    nushell
    # lmms
    # godot
    rustc
    cargo
    rust-analyzer
    clippy
    unzip
    termdown
    tty-clock
    qview
    mpc
    mpd
    ripgrep
    nix-inspect
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
    hyprprop
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
    firefox
    vesktop
    foot
    hyprland
    hyprpaper
    hyprpicker
    polkit_gnome
    fish
    fishPlugins.tide
    walker
    grimblast
    slurp
    catppuccin-kvantum
    catppuccin-gtk
    dunst
    libnotify
    playerctl
    yazi
    neovim
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
    protonup
    lutris
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.iosevka
    sn-pro
  ];
}
