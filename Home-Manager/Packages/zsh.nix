{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	zsh = {
	  enable = true;
	  autocd = true;
	  oh-my-zsh = {
		enable = true;
	  };
	  initExtra = "
	  {tmux && exit;}
	  alias cat='bat'
	  alias vim='nvim'";
	  prezto = {
		enable = true;
		tmux = {
			autoStartLocal = true;
			autoStartRemote = true;
		};
	  };
	};
     };
   };
}
