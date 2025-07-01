{ pkgs, ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk_6.0.428"
      ];
    };
  };
}
