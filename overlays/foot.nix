self: super: {
        foot = super.foot.overrideAttrs (old: {
            mesonBuildFlags = (old.mesonBuildFlags or []) ++ [
            "-Dc_args=-O3 -march=native -pipe"
            ];
            });
      }
