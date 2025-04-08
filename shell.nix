# following this vid
# https://www.youtube.com/watch?v=6fftiTJ2vuQ
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  packages = [
    (pkgs.python313.withPackages(p: with p; [
      numpy
    ]))
  ];
}
