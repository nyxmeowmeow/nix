{
  pkgs,
  lib,
  ...
}: {
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     my-clipse = prev.buildGoModule {
  #       pname = "clipse";
  #       version = "9.9.9";
  #
  #       src = prev.fetchFromGitHub {
  #         owner = "savedra1";
  #         repo = "clipse";
  #         rev = "ebb2810812aad967e86d269cf14d413eb5f2dc9e";
  #         hash = "sha256-6UqdhWvitfHSDmiBa98Sn4PDvbH9shugjc0o4pyU52w=";
  #       };
  #
  #       vendorHash = "sha256-ANMeYiN+66F8EF7dB8+zuQyuT3moSuNxX8+vQ9GH2w4=";
  #
  #       meta = {
  #         description = "Configurable TUI clipboard manager for Unix ";
  #         homepage = "https://github.com/savedra1/clipse";
  #         license = lib.licenses.mit;
  #         maintainers = [ lib.maintainers.savedra1 ];
  #       };
  #     };
  #   })
  # ];
  #
  # environment.systemPackages = with pkgs; [
  #   clipse
  # ];
}
