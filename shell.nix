{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }:

let
  # Создаем свою версию steam-run с библиотекой NSS и другими зависимостями
  mySteamRun = (pkgs.steam.override {
    extraPkgs = pkgs: with pkgs; [
      nss
      nspr
      gtk3
      pango
      cairo
      atk
      gdk-pixbuf
      glib
      dbus
      xorg.libX11
      xorg.libxcb
      xorg.libXcomposite
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrandr
      xorg.libXrender
      xorg.libXScrnSaver
      xorg.libXtst
      alsa-lib
      cups
      expat
      libdrm
      mesa
    ];
  }).run;
in
pkgs.mkShell {
  name = "easyeda-std-shell";
  packages = [ mySteamRun ];
  shellHook = ''
    echo "⚡ EasyEDA Std Environment Loaded"
    echo "Run: steam-run ./easyeda-linux-x64/easyeda"
  '';
}
