{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    gdb


    kotlin
    kotlin-language-server
    kotlin-interactive-shell

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
