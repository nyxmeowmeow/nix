{ config, pkgs, ... }: {

  services.clipse = {
    imageDisplay = {
      type = "sixel";
    };
    theme = {
      useCustomTheme = true;
      DimmedDesc = "#a5adcb";
      DimmedTitle = "#a5adcb";
      FilteredMatch = "#cad3f5";
      NormalDesc = "#000000";
      NormalTitle = "#cad3f5";
      SelectedDesc = "#ffffff";
      SelectedTitle = "#ffffff";
      SelectedBorder = "#ffffff";
      SelectedDescBorder = "#ffffff";
      TitleFore = "#ffffff";
      Titleback = "#434C5E";
      StatusMsg = "#ffffff";
      PinIndicatorColor = "#ff0000";
    };
  };
}
