{ config, pkgs, ...}:

{
	 imports = [
    		./modules
 	 ];	

	home.username = "tux";
	home.homeDirectory = "/home/tux";
	home.stateVersion = "26.05";

	home.sessionVariables = {
  GDK_SCALE = "1";
#  GDK_DPI_SCALE = "0.75";
  QT_SCALE_FACTOR = "1";
 # QT_FONT_DPI = "168";
  _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
};

	
	xresources.properties = {
  "Xft.dpi" = 168;
};   

	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake '/home/tux/nixos-dotfiles#nixxie'";
			nrb = "sudo nixos-rebuild boot --flake '/home/tux/nixos-dotfiles#nixxie'";
			ncg = "sudo nix-collect-garbage -d";
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

	home.file.".xinitrc".text = ''
	 picom &
 	 exec qtile start
	'';

	home.file.".config/qtile/".source = ./qtile;
	
	programs.brave = {
		enable = true;
		extensions = [
			"nngceckbapebfimnlniiiahkandclblb"
		];
	};
	
	programs.rofi = {
		enable = true;
		theme = "Arc-Dark";


		extraConfig = {
      			modi = "drun,run";
      			font = "JetBrainsMono Nerd Font 12";
			                show-icons = true;
                icon-theme = "Adwaita-dark";
			dpi = 168;
		};
	};
	
	services.picom = {
	enable = true;
	backend = "xrender";
	};

	home.packages = with pkgs; [
		bat
		steam
		libreoffice
		discord
	];
}
