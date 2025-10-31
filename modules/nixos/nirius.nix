{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      my-clipse = prev.buildGoModule {
        pname = "nirius";
        # version = "9.9.9";

        src = prev.fetchFromSourcehut {
          owner = "tsdh";
          repo = "nirius";
          rev = "804e078177315ca4dd46684372e397e15157973f";
          hash = "sha256-6UqdhWvitfHSDmiBa98Sn4PDvbH9shugjc0o4pyU52w=";
        };

        vendorHash = "sha256-ANMeYiN+66F8EF7dB8+zuQyuT3moSuNxX8+vQ9GH2w4=";

        # meta = {
        #   description = "";
        #   homepage = "";
        #   license = lib.licenses.mit;
        #   maintainers = [ lib.maintainers.savedra1 ];
        # };
      };
    })
  ];

  environment.systemPackages = with pkgs; [
    nirius
  ];
}
