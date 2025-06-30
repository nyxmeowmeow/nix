{ zen-browser, ... }: {


  home.packages = [ zen-browser.packages."x86_64-linux".default ];
}
  # environment.systemPackages = [ zen-browser.packages."x86_64-linux".default ];
