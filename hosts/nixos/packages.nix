{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # darkly
    cryptsetup

    # nyaa
    rqbit

    zellij

    # blender

    zulu # java 21
    zulu8 # java 8

    # kitty
    # ghostty

    hyprpaper
    hyprpicker
    # qemu_kvm

    # gnome-online-accounts
    # gnome-control-center
    # glib

    quickshell

    # expect

    /* image editing */
    # gimp
    krita
    # aseprite

    /* video */
    ffmpeg
    mpv
    # davinci-resolve
    vulkan-tools

    /* games */
    olympus
    osu-lazer
    tt
    vitetris
    cl-wordle

    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils

    /* misc terminal stuff */
    termdown
    tty-clock
    fastfetch

    qview
    obs-studio
    wf-recorder
    playerctl
    mpc

    wl-clipboard

    udiskie
    udisks2
    gvfs

    wget
    dbus
    polkit_gnome

    dunst
    libnotify

    dconf
    mesa
    libGL
    libdrm
    xwayland
    libevdev

    wine
    wine64
    # bottles
    # lutris
    # mono


    # (discord.override {
    #  withMoonlight = true;
    #  moonlight = inputs.moonlight.packages.${pkgs.system}.moonlight-mod;
    #  })
    vesktop

  ] ++ [
    inputs.pollymc.packages."x86_64-linux".default
  ];
}
