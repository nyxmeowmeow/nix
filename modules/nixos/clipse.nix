self: super: {
  clipse = super.buildGoModule rec {
    pname = "clipse";
    version = "1.1.0";

    src = super.fetchFromGitHub {
      owner = "savedra1";
      repo = "clipse";
      rev = "ebb2810812aad967e86d269cf14d413eb5f2dc9e";
      hash = "sha256-..."; # updated hash
    };

    vendorHash = "sha256-...";

    meta = {
      description = "Useful clipboard manager TUI for Unix";
      homepage = "https://github.com/savedra1/clipse";
      license = super.lib.licenses.mit;
      mainProgram = "clipse";
    };
  };
}
