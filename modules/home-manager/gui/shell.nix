{ inputs, pkgs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = null;  # Don't symlink since we're using the bundled version
    extraPackages = with pkgs; [
      inputs.shell.packages.${pkgs.system}.default
    ];
  };
}
