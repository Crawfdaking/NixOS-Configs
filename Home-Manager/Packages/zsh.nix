{ config, pkgs, lib, ... }:

{
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	zsh = {
	  enable = true;
	  autocd = true;
	  initExtra = "
	  if [ \"$TMUX\" = \"\" ]; then
	  tmux;
	  fi
	  alias cat='bat'
	  alias vim='nvim'
	  #unset TMUX";
	};
     };
   };
}
