{ pkgs ? import <nixpkgs> { overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    neovim-nightly
    luajit
  ];
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.zlib}/lib:${pkgs.sqlite.out}/lib:$LD_LIBRARY_PATH
    alias nvim="nvim -u ./init.lua"
  '';
}
