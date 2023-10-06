{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	git = {
	  enable = true;
	  userEmail = "Crawfordlee03@gmail.com";
	  userName = "Crawford";
	};
     };
   };
}
