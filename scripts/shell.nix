with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "dev";
  shellHook = ''
    echo "Created dev env and linked nix_ld"
    export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
  '';
}
