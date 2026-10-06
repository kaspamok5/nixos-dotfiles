{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];
  nixpkgs.config.allowUnfree=true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nixxie";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Vilnius";

  i18n = {
	defaultLocale = "en_US.UTF-8";
	extraLocales = ["lt_LT.UTF-8/UTF-8"];
	extraLocaleSettings = {
    LC_CTYPE = "en_US.UTF8";
    LC_ADDRESS = "lt_LT.UTF-8";
    LC_IDENTIFICATION = "lt_LT.UTF-8";
    LC_MEASUREMENT = "lt_LT.UTF-8";
    LC_MESSAGES = "lt_LT.UTF-8";
    LC_MONETARY = "lt_LT.UTF-8";
    LC_NAME = "lt_LT.UTF-8";
    LC_NUMERIC = "lt_LT.UTF-8";
    LC_PAPER = "lt_LT.UTF-8";
    LC_TELEPHONE = "lt_LT.UTF-8";
    LC_TIME = "lt_LT.UTF-8";
    LC_COLLATE = "lt_LT.UTF-8";
 	 };
	};

services.xserver = {
	enable = true;
	videoDrivers = [ "modesetting" ];
	windowManager.qtile = {
		enable = true;
		package = pkgs.python3.pkgs.qtile.override {
			wlroots = pkgs.wlroots_0_20;
		};
	};
	displayManager.startx.enable = true;
	xkb.layout = "us,lt";
  	xkb.options = "grp:alt_shift_toggle";
};
virtualisation.vmware.guest.enable = true;  
  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };
   users.users.tux = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
   };
programs.dconf.enable = true;
   environment.systemPackages = with pkgs; [
     	vim
     	wget
	nano	
	alacritty
	rofi
	mousepad
	brave
	htop
	pfetch
	picom
	pavucontrol
	alsa-utils
	git
   ];
fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
	corefonts
	vista-fonts
];
nix.gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 7d";
};
  system.stateVersion = "26.05";
}
