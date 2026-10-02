{ pkgs, lib, ... }:
let
  happ = pkgs.stdenv.mkDerivation rec {
    pname = "happ";
    version = "2.16.2";
    src = pkgs.fetchurl {
      url = "https://github.com/Happ-proxy/happ-desktop/releases/download/${version}/Happ.linux.x64.deb";
      hash = "sha256-UffOBCmk2vXsAgGndYZBBU796vrHdihaB4jlBrOL//U=";
    };
    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      dpkg
    ];
    buildInputs = with pkgs; [
      stdenv.cc.cc  # for libstdc++
      libGL
      libxcb
      libz
      fontconfig
      freetype
      libgpg-error
      e2fsprogs  # for libcom_err
    ];
    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      cp -r usr/share $out/
      cp -r opt/ $out/
      ln -s ../opt/happ/bin/Happ $out/bin/happ

      # openssl libs are loaded dynamically, make them visible for happ
      ln -s ${lib.getLib pkgs.openssl}/lib/libcrypto.so $out/opt/happ/lib/
      ln -s ${lib.getLib pkgs.openssl}/lib/libssl.so $out/opt/happ/lib/

      # broken - missing libQt6WlShellIntegration.so.6
      rm $out/opt/happ/lib/plugins/wayland-shell-integration/libwl-shell-plugin.so

      runHook postInstall
    '';
  };
in {
  environment.systemPackages =  [
    happ
  ];
  systemd.services.happd = {
    # replicate systemd settings from the package
    wantedBy = [  "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${happ}/opt/happ/bin/happd";
      Restart = "on-failure";
      RestartSec = "5s";
      NoNewPrivileges = false;

      TimeoutStopSec = "10s";
      KillMode = "mixed";
      KillSignal = "SIGTERM";
    };
  };
}
