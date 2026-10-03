{ config, pkgs, ...}:

{
	 imports = [
    		./modules
 	 ];	

	home.username = "tux";
	home.homeDirectory = "/home/tux";
	home.stateVersion = "26.05";
	
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake '/home/tux/nixos-dotfiles#nixxie'";
		};

		initExtra = ''
			pfetch
		'';
	};
	
	programs.alacritty = {
		enable = true;
		settings = {
		    font = {
		      size = 12.0;
		      normal = {
			family = "JetBrainsMono Nerd Font";
			style = "Medium";
		      };
		      bold = {
			family = "JetBrainsMono Nerd Font";
			style = "Heavy";
		      };
		      italic = {
			family = "JetBrainsMono Nerd Font";
			style = "Medium Italic";
		      };
		      bold_italic = {
			family = "JetBrainsMono Nerd Font";
			style = "Heavy Italic";
		      };
		    };
		    general = {
		      live_config_reload = true;
		    };
};
	};

	programs.git = {
		enable = true;
		userEmail = "kaspamok5@gmail.com";
		userName = "kaspamok5";
	};

	home.file.".config/qtile/".source = ./qtile;

	programs.gh = {
  		enable = true;
  		gitCredentialHelper.enable = true; # default
	};
	
	programs.brave = {
		enable = true;
		extensions = [
			"nngceckbapebfimnlniiiahkandclblb"
		];
	};

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
    platformTheme = "gtk3";          # or "gnome" on GNOME
    style.name    = "adwaita-dark";
  };

	  home.sessionVariables = {
    GTK_THEME                      = "Adwaita-dark";
    GTK_APPLICATION_PREFER_DARK_THEME = "1";
    QT_STYLE_OVERRIDE              = "adwaita-dark";
  };
			
	home.packages = with pkgs; [
		bat
		steam
	];
}
