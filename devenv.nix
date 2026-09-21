{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    openssl
    gcc
    flutter_rust_bridge_codegen
    ninja
    clang
    gtk3
    pkg-config
    rustup
  ];

  languages.dart.enable = true;

  android = {
    enable = true;
    flutter.enable = true;
    cmake.version = [ "4.1.2" ];

    platforms.version = [
      "35"
      "36"
    ];

    buildTools.version = [
      "35.0.0"
    ];

    ndk = {
      enable = true;
      version = [
        "28.2.13676358"
      ];
    };

    abis = [
      "arm64-v8a"
      "x86_64"
    ];

    android-studio = {
      enable = true;
      package = pkgs.android-studio;
    };
  };

  languages.rust = {
    enable = true;
    channel = "stable";
    version = "latest";
    components = [
      "rustc"
      "cargo"
      "rustfmt"
      "rust-analyzer"
      "clippy"
      "rust-src"
    ];
  };

  scripts.check.exec = ''
    echo "Flutter & Rust Environment:"
    flutter --version
    rustc --version
    cargo --version
    echo "ANDROID_HOME: $ANDROID_HOME"
  '';

}

