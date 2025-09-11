{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [


    arduino-cli
    gdb

    kotlin
    kotlin-language-server
    kotlin-interactive-shell
    gradle
    zulu # java 21
    zulu8 # java 8

    # zig

    go

    nixd

    python3

    # haskell-language-server
    # ghc

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
