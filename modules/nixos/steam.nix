{
  pkgs,
  config,
  ...
}: {
  programs = {
    steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      fontPackages = [ config.stylix.fonts.monospace.package ];
      gamescopeSession.enable = true;
      remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = false; # Open ports in the firewall for Steam Local Network Game Transfers

      # nix-gaming
      platformOptimizations.enable = true;
    };

    gamemode.enable = true;

    gamescope = {
      enable = true;
      args = [
        "-w 2560"
        "-h 1440"
        "-r 165"
        "--expose-wayland"
      ];
    };
  };
}
