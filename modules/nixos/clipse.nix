{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "clipse";

  src = fetchFromGitHub {
    owner = "savedra1";
    repo = "clipse";
    rev = "ebb2810812aad967e86d269cf14d413eb5f2dc9e";
    hash = "sha256-Kpe/LiAreZXRqh6BHvUIn0GcHloKo3A0WOdlRF2ygdc=";
  };

  vendorHash = "sha256-Hdr9NRqHJxpfrV2G1KuHGg3T+cPLKhZXEW02f1ptgsw=";

  meta = {
    description = "Useful clipboard manager TUI for Unix";
    homepage = "https://github.com/savedra1/clipse";
    license = lib.licenses.mit;
    mainProgram = "clipse";
    maintainers = [ lib.maintainers.savedra1 ];
  };
}
