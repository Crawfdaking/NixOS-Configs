{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	git = {
	  enable = true;
	  userEmail = (builtins.readFile /etc/nixos/Env/gitEmail.env);
	  userName = "Crawford";
	};
     };
   };
}
