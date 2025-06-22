{
  programs.nixvim.plugins.tiny-inline-diagnostic = {
    enable = true;

    lazyLoad.settings.event = [
      "DeferredUIEnter"
    ];

    settings = {
      preset = "modern";
      transparent_bg = false;

      signs = {
        left = "";
        right = "";
        diag = "";
        arrow = "     ";
        up_arrow = "     ";
        vertical = " │";
        vertical_end = " └";
      };

      hi = {
        error = "DiagnosticError";
        warn = "DiagnosticWarn";
        info = "DiagnosticInfo";
        hint = "DiagnosticHint";
        arrow = "NonText";
        background = "CursorLine";
        mixing_color = "None";
      };


    };
  };
}
