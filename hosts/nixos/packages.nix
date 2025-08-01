{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # blender

    zulu

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

    # gimp
    krita
    aseprite

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
    # walker
    udiskie
    udisks2
    gvfs
    wget
    dbus
    vesktop
    # moonlight
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
    # bottles
    # lutris
    # mono


    # (discord.override {
    #  withMoonlight = true;
    #  moonlight = inputs.moonlight.packages.${pkgs.system}.moonlight-mod;
    #  })

  ] ++ [
    inputs.pollymc.packages."x86_64-linux".default
    # inputs.walker.packages."x86_64-linux".default
  ];
}
