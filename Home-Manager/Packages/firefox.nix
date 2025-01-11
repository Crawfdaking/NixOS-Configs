{ config, pkgs, lib, ... }:
let
nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {inherit pkgs;};
in {
    home-manager.users.crawford = {pkgs, config, lib, ...}: {
     programs = {
	firefox = {
	  enable = true;
	  package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
            extraPolicies = {
                CaptivePortal = false;
                DisableFirefoxStudies = true;
                DisablePocket = true;
                DisableTelemetry = true;
                DisableFirefoxAccounts = false;
                NoDefaultBookmarks = true;
                OfferToSaveLogins = false;
                OfferToSaveLoginsDefault = false;
                PasswordManagerEnabled = false;
                FirefoxHome = {
                    Search = true;
                    Pocket = false;
                    Snippets = false;
                    TopSites = false;
                    Highlights = false;
                };
		UserMessaging = {
                    ExtensionRecommendations = false;
                    SkipOnboarding = true;
                };
	    };
         };
	  profiles = {
		crawford = {
			id = 0;
			name = "Crawford";
			#nur-no-pkgs
			extensions = with nur.repos.rycee.firefox-addons; [
					bitwarden
					privacy-badger
					ublock-origin
					temporary-containers
					sponsorblock
					augmented-steam
					multi-account-containers
					#I use another version not listed in NUR (will sync with firefox account)
					#grammarly
				];
			search = {
				force = true;
				default = "Brave";
				engines = {
					"Nix Packages" = {
    					 urls = [{
      					 template = "https://search.nixos.org/packages";
      					 params = [
        					{ name = "type"; value = "packages"; }
        					{ name = "query"; value = "{searchTerms}"; }
      					 ];
    				       }];
					icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    					definedAliases = [ "@np" ];
				    };
				    "NixOS Wiki" = {
    				      urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
    				      iconUpdateURL = "https://nixos.wiki/favicon.png";
    				      updateInterval = 24 * 60 * 60 * 1000; # every day
    				      definedAliases = [ "@nw" ];
  				};
				"Home-Manager Options" = {
				      urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";}];
				      definedAliases = ["@hmo"];
				};
				"Brave" = {
				urls = [{ template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
				definedAliases = ["@br"];
				#iconUpdateURL = "https://cdn.search.brave.com/serp/v2/_app/immutable/assets/favicon-32x32.86083f5b.png";
				};
			     };
			};
		};
	  };
	}; #End firefox config
      };
   };
  users.users.crawford = {
		packages = with pkgs; [
			#Soft Dependency of Firefox
			speechd
		];
	};
}
