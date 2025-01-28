{ config, pkgs, lib, ... }:

{
    #home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	git = {
	  enable = true;
	  #userEmail = (builtins.readFile ../../Env/gitEmail.env);
	  userName = "Crawford";
	};
     };
   #};
}
