{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    hyprpaper
    qemu_kvm

    gnome-online-accounts
    gnome-control-center
    glib

    quickshell

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

    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils

    termdown
    tty-clock

    # qview
    mpc
    mpv
    obs-studio
    wf-recorder

    libevdev
    wl-clipboard
    walker
    udiskie
    udisks2
    gvfs
    wget
    dbus
    vesktop
    polkit_gnome
    dunst
    libnotify
    playerctl
    yazi
    # stylua
    fastfetch
    dconf
    mesa
    libGL
    libdrm
    xwayland

    wine
    wine64
    bottles
    mono
  ];
}
