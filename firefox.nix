{ config, pkgs, lib, ... }:
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {inherit pkgs;};
in {

home-manager.users.crawford = {pkgs, config, lib, ...}: {

	programs = {

		firefox.profiles.crawford = {
			extensions = with nur-no-pkgs.repos.rycee.firefox-addons; [
				bitwarden
			];};
		};
	};

}
