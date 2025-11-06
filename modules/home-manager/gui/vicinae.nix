{
  inputs,
  pkgs,
    ...
}: {
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];
  services.vicinae = {
    enable = true;
    autoStart = true;
# settings = {
#     faviconService = "twenty"; # twenty | google | none
#     font.size = 11;
#     popToRootOnClose = false;
#     rootSearch.searchFiles = false;
#     theme.name = "vicinae-dark";
#     window = {
#       csd = true;
#       opacity = 0.95;
#       rounding = 10;
#     };
# };
# # Installing (vicinae) extensions declaratively


# raycast://extensions/thomas/color-picker?source=webstore
extensions = [
#   (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
#     inherit pkgs;
#     name = "balatro-compendium";
#     src = pkgs.fetchFromGitHub { # You can also specify different sources other than github
#       owner = "raycast";
#       repo = "extensions/tree/main/extensions/balatro-compendium";
#       rev = "f4b1ca09af17e754f02437a3f6145f45327892bf"; # If the extension has no releases use the latest commit hash
#       # You can get the sha256 by rebuilding once and then copying the output hash from the error message
#       sha256 = "sha256-kbsdvIdye4/qQEEmIYh1K1vzlz+rcKJJOJo0Rv9if+s=";
#     };
# # If the extension is in a subdirectory you can add ` + "/subdir"` between the brace and the semicolon here
#   })
  (inputs.vicinae.mkVicinaeExtension.${pkgs.system} {
    inherit pkgs;
    name = "case-converter";
    src = pkgs.fetchFromGitHub {
      owner = "nyxmeowmeow";
      repo = "vicinae-extensions";
      rev = "12fefbb2f852c38ac1b418c5955ed6ab070bafe3";
      sha256 = "sha256-6eDqc98qzg1y+O7pbfS69gEelTVPqi+7PK7X1a+S5qE=";
    } + "/case-converter";
  })
];
  };
}
