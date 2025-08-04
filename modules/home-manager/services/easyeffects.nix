{
  services.easyeffects = {
    enable = true;
    preset = "my-preset";
    extraPresets = {
    my-preset = {
      output = {
        equalizer = {
          output-gain = -20.0;
          band0 = {
            frequency = 105.0;
            gain = 2.0;
            # mode = "LSC";
            q = 0.7;
          };
          band1 = {
            frequency = 116.8;
            gain = -4.4;
            # mode = "PK";
            q = 0.44;
          };
          band2 = {
            frequency = 194.8;
            gain = -1.4;
            # mode = "PK";
            q = 1.3;
          };
          band3 = {
            frequency = 347.2;
            gain = 3.0;
            # mode = "PK";
            q = 1.04;
          };
          band4 = {
            frequency = 933.1;
            gain = 1.1;
            # mode = "PK";
            q = 0.59;
          };
          band5 = {
            frequency = 1771.8;
            gain = 1.5;
            # mode = "PK";
            q = 2.33;
          };
          band6 = {
            frequency = 1785.9;
            gain = -1.6;
            # mode = "PK";
            q = 2.69;
          };
          band7 = {
            frequency = 3858.0;
            gain = 3.7;
            # mode = "PK";
            q = 6.0;
          };
          band8 = {
            frequency = 7780.3;
            gain = -3.0;
            # mode = "PK";
            q = 4.13;
          };
          band9 = {
            frequency = 10000.0;
            gain = -7.0;
            # mode = "HSC";
            q = 0.7;
          };
        };
      };
      plugins-order = [
      "equalizer"
      ];
    };
  };
  };
}
