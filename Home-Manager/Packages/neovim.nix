{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	neovim = {
	  enable = true;
	  defaultEditor = true;
	};
     };
   };
}
