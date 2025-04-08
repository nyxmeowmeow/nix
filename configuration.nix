{ config, pkgs, ... }: {
  imports = [
      ./hardware-configuration.nix
    ];

  environment.systemPackages = with pkgs; [
    jq
    wl-clipboard
    clipse
    eza
    fzf
    zoxide
    waybar
    vscodium
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
    polkit_gnome
    fish
    walker
    grimblast
    slurp
    #catppuccin-kvantum
    #catppuccin-gtk
    dunst
    libnotify
    playerctl
    yazi
    neovim
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


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
  "video=DP-1:2560x1440@165"
  "video=DP-3:2560x1440@75"
];


  networking.hostName = "nixos"; # Define your hostname.

  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.mononoki
    pkgs.nerd-fonts.iosevka
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Brisbane";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.gamemode.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables = { # protonup install path
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/meow/.steam/root/compatibilitytools.d";
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  services.flatpak.enable = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.udisks2.enable = true; 
  systemd.services.udiskie.enable = true;
  services.gvfs.enable = true;



  services.dbus.enable = true;

  
  systemd.user.services.clipse = {
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.clipse}/bin/clipse";
  };




  services.xserver.displayManager = {
    gdm.enable = false;
    lightdm.enable = false;
  };


  security.polkit.enable = true;

  security.polkit.extraConfig = ''
    /* Allow members of the 'wheel' group to mount devices via Nautilus */
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.udisks2.filesystem-mount" && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  



  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];





  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.fish.enable = true;

  users.users.meow = {
    isNormalUser = true;
    description = "meow";
    extraGroups = [ "networkmanager" "wheel" "storage" "plugdev" "video" "audio" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };



  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;



  system.stateVersion = "24.11";

}
