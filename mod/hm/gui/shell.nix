{
  inputs,
  pkgs,
  ...
}: {
  # imports = [ inputs.ags.homeManagerModules.default ];
  #
  # programs.ags = {
  #   enable = true;
  #   configDir = null;  # Don't symlink since we're using the bundled version
  #   extraPackages = with pkgs; [
  #     inputs.meow-shell.packages.${pkgs.system}.default
  #   ];
  # };
  #
  # # home.packages = with pkgs; [
  # #   meow-shell
  # # ];
  # #
  # #
  # #
  # systemd.user.services.meow-shell = {
  #   Unit = {
  #     Description = "My AGS Shell";
  #     After = ["graphical-session.target"];
  #     Wants = ["graphical-session.target"];
  #   };
  #   Service = {
  #     Type = "simple";
  #     ExecStart = "${inputs.meow-shell.packages."x86_64-linux".default}/bin/meow-shell";
  #     Restart = "on-failure";
  #     RestartSec = 3;
  #   };
  #   Install = {
  #     WantedBy = ["graphical-session.target"];
  #   };
  # };
}
