{ config, pkgs, lib, ... }:

let
  mono = pkgs.mono;
in
{
  home.packages = [
    pkgs.jetbrains.rider
    mono
  ];
}
