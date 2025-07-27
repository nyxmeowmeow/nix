{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gdb
    xorg.libX11



    # zig

    go

    nixd

    python3

    haskell-language-server
    ghc

    gcc
    clang
    clang-tools

    rustc
    cargo
    rust-analyzer
    clippy
    pkg-config
  ];
}
