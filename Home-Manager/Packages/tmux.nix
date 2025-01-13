{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	tmux = {
		enable = true;
				#keyMode = "vi";
				#prefix = "C-a";
				#plugins = with pkgs.tmuxPlugins; [
				#];
	};
     };
	xdg.configFile."tmux" = {
	source = /home/crawford/Tmux-Config;
	recursive = true;
	};
      #xdg.configFile."tmux/resurrect/.empty".text = "";
   };
}
