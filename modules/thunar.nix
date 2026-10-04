{ config, pkgs, lib, ... }:

{
	home.packages = [
    (pkgs.thunar.override {
      thunarPlugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    })
    pkgs.tumbler
  ];

  xfconf.enable = true;
}
