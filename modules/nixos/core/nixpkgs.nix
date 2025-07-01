{ pkgs, ... }: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = with pkgs; [
        dotnet-sdk_6
      ];
    };
  };
}
