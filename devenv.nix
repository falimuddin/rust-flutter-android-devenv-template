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
    cmake
    ninja
  ];

  languages.dart.enable = true;

  android = {
    enable = true;
    flutter.enable = true;
    platforms.version = [
      "34"
      "35"
    ];
    buildTools.version = [ "34.0.0" ];
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
