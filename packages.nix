{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
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
    grim
    slurp
    tesseract # ocr
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
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.iosevka
    sn-pro
  ];
}
