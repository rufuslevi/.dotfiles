with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "dev";
  shellHook = ''
    echo "Created dev env and linked nix_ld"
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
    export CMAKE_C_COMPILER=${pkgs.gcc}/bin/gcc
    export CMAKE_CXX_COMPILER=${pkgs.clang}/bin/gcc
  '';
}
