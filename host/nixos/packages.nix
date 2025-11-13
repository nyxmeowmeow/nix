{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # nirius
    zenity
    blender


    nix-search-tv


    # qutebrowser
    # python313Packages.adblock
    # python312Packages.adblock


    # reaper # borken
    # reaper-reapack-extension
    # reaper-sws-extension

    # gtk3
    # zrythm # borken
    # lmms # borken
    ardour

    # walker
    rofi
    # tridactyl-native

    zoom-us

    fuzzel

    cryptsetup

    # nyaa
    rqbit

    /* image */
    # gimp
    krita
    inkscape
    # aseprite
    # qview
    # pastel
    imagemagick

    /* video */
    ffmpeg
    # davinci-resolve
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
    # ttyper
    vitetris
    cl-wordle
    # luanti

    /* misc terminal stuff */
    termdown
    # tty-clock
    fastfetch
    # zellij
    # expect
    yt-dlp
    tldr

    /* audio */
    playerctl

    /* file */
    # zenity
    # xdg-desktop-portal-termfilechooser
    xdg-utils

    /* misc */
    wl-clipboard
    dbus
    dconf
    libevdev
    # qemu_kvm
    hyprpicker
    quickshell


    xwayland

    # (discord.override {
    #  withMoonlight = true;
    #  moonlight = inputs.moonlight.packages.${pkgs.system}.moonlight-mod;
    #  })
    vesktop

  ] ++ [
    inputs.pollymc.packages."x86_64-linux".default
  ];
}
