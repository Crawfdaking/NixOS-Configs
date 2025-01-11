{config, pkgs, ...}: {

	
    users.users.crawford = {
    	packages = with pkgs; [
		#obs-studio
		#obs-studio-plugins.obs-ndi
    	];
   };




}
