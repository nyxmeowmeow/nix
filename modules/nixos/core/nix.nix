{ pkgs, ... }: {
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # auto-optimise-store = true; # optimise on every rebuild
      keep-derivations = false;
      keep-outputs = false;
    };

    optimise = {
      automatic = true;
      dates = [ "00:00" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
  };
  environment.systemPackages = with pkgs; [
    cachix
  ];
}
