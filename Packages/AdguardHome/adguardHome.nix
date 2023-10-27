{ config, pkgs, ... }:

{

  # enable the adguard home service
  services.adguardhome = {
    enable = true;
    settings = {
    	bind_host = "192.168.1.33";
    	bind_port = 80;
	dns = {
		bind_hosts = ["192.168.1.33" "100.65.23.24"];
	};
	# Starting on version 0.107.33 this will be used to control the web portal 
	#http = {
		#address = ["192.168.1.33:80" "100.65.23.24:80"];
	#};

    };
  };

    networking.firewall = {

    # allow Adguard DNS through the firewall
    allowedUDPPorts = [ 53 67 68];
    allowedTCPPorts = [ 53 80]; #Port 3000 is the default when adguard is first installed
  };


}
