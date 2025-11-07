{ inputs, ... }: {
  home.packages = [
    inputs.ytsub.packages."x86_64-linux".default
  ];
}
