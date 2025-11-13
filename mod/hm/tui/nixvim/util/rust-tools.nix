{
  plugins.rust-tools = {
    enable = true;
    server = {
      inlayHints = {
        enable = true;
        typeHints.enable = false;
        parameterHints.enable = false;
        genericParameterHints.const.enable = false;
        expressionAdjustmentHints.enable = false;
        closingBraceHints = {
          enable = true;
          minLines = 15;
        };
      };
    };
  };
}
