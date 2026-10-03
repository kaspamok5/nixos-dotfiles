{ config, pkgs, ...}:

{
	home.username = "tux";
	home.homeDirectory = "/home/tux";
	home.stateVersion = "26.05";
	
	programs.bash = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch";
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
	
	home.packages = with pkgs; [
		bat
	];
}
