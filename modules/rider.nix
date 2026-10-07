{ pkgs, ... }:
let
  mono = pkgs.mono;
  msbuild = pkgs.msbuild;

  rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    nativeBuildInputs = (attrs.nativeBuildInputs or []) ++ [ pkgs.makeWrapper ];
    postInstall = ''
      mv $out/bin/rider $out/bin/.rider-toolless
      makeWrapper $out/bin/.rider-toolless $out/bin/rider \
        --argv0 rider \
        --prefix PATH : "${pkgs.lib.makeBinPath [ mono msbuild ]}" \
        --set MSBUILD_EXE_PATH "${msbuild}/lib/mono/msbuild/Current/bin/MSBuild.dll"
    '' + (attrs.postInstall or "");
  });
in
{
  home.packages = [
    rider
    (pkgs.writeShellScriptBin "mono" ''
      exec ${pkgs.mono}/bin/mono "$@"
    '')
    (pkgs.writeShellScriptBin "msbuild" ''
      exec ${msbuild}/bin/msbuild "$@"
    '')
  ];
}   
