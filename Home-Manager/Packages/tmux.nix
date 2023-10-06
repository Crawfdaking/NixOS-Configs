{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	tmux = {
		enable = true;
		keyMode = "vi";
		prefix = "C-a";
		plugins = with pkgs; [
			{
    			    plugin = tmuxPlugins.vim-tmux-navigator;
    			    extraConfig = "set -g @plugin 'christoomey/vim-tmux-navigator'";
  			}
		];
		#extraConfig = "";
	};
     };
   };
}
