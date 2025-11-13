# FIXME disables for a second on every rebuild
{ config, ... }: {
# from https://github.com/nix-community/home-manager/issues/5185
# systemd.user.services.easyeffects.Service.ExecStartPost = [
#   "${config.services.easyeffects.package}/bin/easyeffects --load-preset ${config.services.easyeffects.preset}"
# ];

  services.easyeffects = {
    enable = true;
    # preset = "normal";
    # extraPresets = {
    #   autoeq = { # hyperx cloud ii autoeq
    #     output = {
    #       blocklist = [];
    #       "equalizer#0" = {
    #         balance = 0.0;
    #         bypass = false;
    #         input-gain = -15.0;
    #         left = {
    #           band0 = {
    #             frequency = 105.0;
    #             gain = 2.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Lo-shelf";
    #             width = 4.0;
    #           };
    #           band1 = {
    #             frequency = 116.80000305175781;
    #             gain = -4.400000095367432;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.4399999976158142;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band2 = {
    #             frequency = 194.8000030517578;
    #             gain = -1.399999976158142;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.2999999523162842;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band3 = {
    #             frequency = 347.20001220703125;
    #             gain = 3.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.0399999618530273;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band4 = {
    #             frequency = 933.0999755859375;
    #             gain = 1.100000023841858;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.5899999737739563;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band5 = {
    #             frequency = 1771.800048828125;
    #             gain = 1.5;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.3299999237060547;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band6 = {
    #             frequency = 1785.9000244140625;
    #             gain = -1.600000023841858;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.690000057220459;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band7 = {
    #             frequency = 3858.0;
    #             gain = 3.700000047683716;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 6.0;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band8 = {
    #             frequency = 7780.2998046875;
    #             gain = -3.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 4.130000114440918;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band9 = {
    #             frequency = 10000.0;
    #             gain = -7.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Hi-shelf";
    #             width = 4.0;
    #           };
    #         };
    #         mode = "IIR";
    #         num-bands = 10;
    #         output-gain = 0.0;
    #         pitch-left = 0.0;
    #         pitch-right = 0.0;
    #         right = {
    #           band0 = {
    #             frequency = 105.0;
    #             gain = 2.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Lo-shelf";
    #             width = 4.0;
    #           };
    #           band1 = {
    #             frequency = 116.80000305175781;
    #             gain = -4.400000095367432;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.4399999976158142;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band2 = {
    #             frequency = 194.8000030517578;
    #             gain = -1.399999976158142;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.2999999523162842;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band3 = {
    #             frequency = 347.20001220703125;
    #             gain = 3.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.0399999618530273;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band4 = {
    #             frequency = 933.0999755859375;
    #             gain = 1.100000023841858;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.5899999737739563;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band5 = {
    #             frequency = 1771.800048828125;
    #             gain = 1.5;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.3299999237060547;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band6 = {
    #             frequency = 1785.9000244140625;
    #             gain = -1.600000023841858;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.690000057220459;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band7 = {
    #             frequency = 3858.0;
    #             gain = 3.700000047683716;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 6.0;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band8 = {
    #             frequency = 7780.2998046875;
    #             gain = -3.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 4.130000114440918;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band9 = {
    #             frequency = 10000.0;
    #             gain = -7.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Hi-shelf";
    #             width = 4.0;
    #           };
    #         };
    #         split-channels = false;
    #       };
    #       "plugins_order" = [
    #         "equalizer#0"
    #       ];
    #     };
    #   };
    #
    #   normal = { # reduced gain
    #     output = {
    #       blocklist = [];
    #       "equalizer#0" = {
    #         balance = 0.0;
    #         bypass = false;
    #         input-gain = -15.0;
    #         left = {
    #           band0 = {
    #             frequency = 105.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Lo-shelf";
    #             width = 4.0;
    #           };
    #           band1 = {
    #             frequency = 116.80000305175781;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.4399999976158142;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band2 = {
    #             frequency = 194.8000030517578;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.2999999523162842;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band3 = {
    #             frequency = 347.20001220703125;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.0399999618530273;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band4 = {
    #             frequency = 933.0999755859375;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.5899999737739563;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band5 = {
    #             frequency = 1771.800048828125;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.3299999237060547;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band6 = {
    #             frequency = 1785.9000244140625;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.690000057220459;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band7 = {
    #             frequency = 3858.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 6.0;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band8 = {
    #             frequency = 7780.2998046875;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 4.130000114440918;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band9 = {
    #             frequency = 10000.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Hi-shelf";
    #             width = 4.0;
    #           };
    #         };
    #
    #         mode = "IIR";
    #         num-bands = 10;
    #         output-gain = 0.0;
    #         pitch-left = 0.0;
    #         pitch-right = 0.0;
    #         right = {
    #           band0 = {
    #             frequency = 105.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Lo-shelf";
    #             width = 4.0;
    #           };
    #           band1 = {
    #             frequency = 116.80000305175781;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.4399999976158142;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band2 = {
    #             frequency = 194.8000030517578;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.2999999523162842;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band3 = {
    #             frequency = 347.20001220703125;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 1.0399999618530273;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band4 = {
    #             frequency = 933.0999755859375;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.5899999737739563;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band5 = {
    #             frequency = 1771.800048828125;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.3299999237060547;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band6 = {
    #             frequency = 1785.9000244140625;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 2.690000057220459;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band7 = {
    #             frequency = 3858.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 6.0;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band8 = {
    #             frequency = 7780.2998046875;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 4.130000114440918;
    #             slope = "x1";
    #             solo = false;
    #             type = "Bell";
    #             width = 4.0;
    #           };
    #           band9 = {
    #             frequency = 10000.0;
    #             gain = 0.0;
    #             mode = "APO (DR)";
    #             mute = false;
    #             q = 0.6666666865348816;
    #             slope = "x1";
    #             solo = false;
    #             type = "Hi-shelf";
    #             width = 4.0;
    #           };
    #         };
    #         split-channels = false;
    #       };
    #       "plugins_order" = [
    #         "equalizer#0"
    #       ];
    #     };
    #   };
    # };
  };
}
