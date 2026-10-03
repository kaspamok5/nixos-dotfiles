{ config, pkgs, lib, ... }:

let
  mono = pkgs.mono;
in
{
  home.packages = [
    pkgs.jetbrains.rider
    mono
    pkgs.msbuild
    pkgs.dotnetCorePackages.dotnet_8.sdk
  ];
}
