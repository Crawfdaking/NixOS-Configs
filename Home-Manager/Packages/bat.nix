{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	bat = {
	 enable = true;
	};
     };
   };
}
