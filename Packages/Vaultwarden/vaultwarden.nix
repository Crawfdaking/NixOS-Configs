{ config, pkgs, lib, ... }:

{
	services.vaultwarden = {
		enable = true;
		#environmentFile = "path to .env";
		#Don't use plain text admin token and change password to something more secure (Probably fine if hosting only inside of a local network)
		config = {
			admin_token = (builtins.readFile /etc/nixos/Env/ValtWardenPW.env);
		};
	};

}
