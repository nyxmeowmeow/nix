{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "tiny-glimmer.nvim";
        version = "2025-07-02";
        src = pkgs.fetchFromGitHub {
          owner = "rachartier";
          repo = "tiny-glimmer.nvim";
          rev = "60a632536e0741c9cecb892f89fbe65a270dc7c7";
          sha256 = "sha256-OjLX1J1CcmnLWdZTapLFNyO+DtMzihWNOQUHfY2qQ3U=";
        };
      })
    ];
    extraConfigLua = ''
require('tiny-glimmer').setup({
    enabled = true,
    disable_warnings = true,
    refresh_interval_ms = 6,

    -- Only use if you have a transparent background
    -- It will override the highlight group background color for `to_color` in all animations
    transparency_color = "#00000000",
     -- Animation configurations
    virt_text = {
        priority = 2048,
    },
})
    '';
  };
}
