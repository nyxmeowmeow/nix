{
  programs.nixvim = {
    plugins.tiny-inline-diagnostic = {
    enable = true;

    # lazyLoad.settings.event = [
    #   "DeferredUIEnter"
    # ];

    settings = {
      preset = "modern";
      transparent_bg = false;

      signs = {
        left         = "";
        right        = "";
        diag         = "";
        arrow        = "     ";
        up_arrow     = "     ";
        vertical     = " │";
        vertical_end = " └";
      };

      hi = {
        error        = "DiagnosticError";
        warn         = "DiagnosticWarn";
        info         = "DiagnosticInfo";
        hint         = "DiagnosticHint";
        arrow        = "None";
        background   = "None";
        mixing_color = "None";
      };
    };
  };

    extraConfigLua = let
      sym = "󰧟 ";
    in /* lua */ ''
local diag = vim.diagnostic
diag.config({
  signs = {
    text = {
      [diag.severity.ERROR] = "${sym}",
      [diag.severity.WARN] = "${sym}",
      [diag.severity.HINT] = "${sym}",
      [diag.severity.INFO] = "${sym}",
    },
  },
})
    '';
  };
}
