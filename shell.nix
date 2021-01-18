{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (luajit.withPackages(ps: with ps; []))
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.zlib}/lib:${pkgs.sqlite.out}/lib:$LD_LIBRARY_PATH
  '';
}
