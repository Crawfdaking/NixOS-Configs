{ config, pkgs, lib, ... }:
let
	tmuxConfig = (pkgs.fetchFromGitHub {
		owner = "Crawfdaking";
		repo = "Tmux-Config";
		rev = "228e016d09632b670379fbc00b7bddffded23aba";
		hash = "sha256-hd4mvyuBBwKxwdbls3UNWmhCVXpG7yFVf1iT+RtGU/4=";
	});
in {
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	tmux = {
		enable = true;
	};
     };
	xdg.configFile."tmux" = {
	source = tmuxConfig;
	recursive = true;
	};

   };
}
