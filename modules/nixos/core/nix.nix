{ pkgs, ... }: {
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # auto-optimise-store = true; # optimise on every rebuild
      keep-derivations = false;
      keep-outputs = false;

      substituters = [
        "https://vicinae.cachix.org"
      ];
      trusted-public-keys = [
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      ];
    };

    optimise = {
      automatic = true;
      dates = [ "00:00" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  environment.systemPackages = with pkgs; [
    cachix
  ];
}
