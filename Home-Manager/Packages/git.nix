{ config, pkgs, lib, ... }:

{
    #home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	git = {
	  enable = true;
	  userEmail = "crawfordlee03@gmail.com"; #(builtins.readFile /home/crawford/Desktop/NixOS-Config/Env/gitEmail.env);
	  userName = "Crawford";
	};
     };
   #};
}
