{ config, pkgs, lib, ... }:

{
 	 programs.git = {
		enable = true;
		settings.user = {
			email = "kaspamok5@gmail.com";
			name = "kaspamok5";
		};
	};

	programs.gh = {
  		enable = true;
  		gitCredentialHelper.enable = true; # default
	};
}
