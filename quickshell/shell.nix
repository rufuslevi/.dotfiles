with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "env";
  shellHook = ''
    # Required for qmlls to find the correct type declarations
    #
    export QMLLS_BUILD_DIRS=${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${quickshell}/lib/qt-6/qml/
    export QML_IMPORT_PATH=$PWD/src
  '';
}
