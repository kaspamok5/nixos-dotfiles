{ config, pkgs, lib, ... }:

{
	gtk = {
		enable = true;
		theme = {
			name    = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
		gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
		gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
	};

	qt = {
		enable        = true;
		platformTheme.name = "gtk3";          # or "gnome" on GNOME
		style.name    = "adwaita-dark";
	};

	home.sessionVariables = {
    		GTK_THEME                      = "Adwaita-dark";
    		GTK_APPLICATION_PREFER_DARK_THEME = "1";
    		QT_STYLE_OVERRIDE              = "adwaita-dark";
  	};
}
