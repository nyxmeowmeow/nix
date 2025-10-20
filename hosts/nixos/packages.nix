{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    qutebrowser
    python313Packages.adblock
    python312Packages.adblock


    reaper # borken
    gtk3
    # zrythm # borken
    # lmms # borken
    ardour

    walker
    rofi
    tridactyl-native

    tldr

    zoom-us

    yt-dlp
    fuzzel


    cryptsetup

    # nyaa
    rqbit

    /* image */
    # gimp
    krita
    inkscape
    # aseprite
    qview
    pastel
    imagemagick

    /* video */
    ffmpeg
    mpv
    # davinci-resolve
    vulkan-tools
    obs-studio
    wf-recorder

    /* graphics */
    mesa
    libGL
    libdrm

    /* games */
    olympus
    osu-lazer
    # tt
    ttyper
    vitetris
    cl-wordle
    # luanti

    /* misc terminal stuff */
    termdown
    tty-clock
    fastfetch
    zellij
    # expect

    /* audio */
    playerctl
    mpc

    /* file */
    udiskie
    udisks2
    gvfs
    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils

    /* misc */
    wl-clipboard
    wget
    dbus
    dconf
    polkit_gnome
    libevdev
    qemu_kvm
    hyprpicker
    swww
    quickshell

    dunst
    libnotify

    xwayland

    /* wine */
    wine
    wine64
    bottles
    # lutris
    mono

    # (discord.override {
    #  withMoonlight = true;
    #  moonlight = inputs.moonlight.packages.${pkgs.system}.moonlight-mod;
    #  })
    vesktop

  ] ++ [
    inputs.pollymc.packages."x86_64-linux".default
  ];
}
