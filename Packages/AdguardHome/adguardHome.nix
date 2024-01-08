{ config, pkgs, ... }:

{

  # enable the adguard home service
  users.users.crawford.packages = with pkgs; [adguardhome];
  services.adguardhome = {
    enable = true;
    allowDHCP = true;
    mutableSettings = true;
    #openFirewall = true;
    #settings = {
	#dns = {
	#	bind_hosts = ["192.168.1.33"]; #"100.65.23.24"];
		#upstream_dns = ["127.0.0.1"];
		#port = 53;
	#};
	#http = {
	#	address = "192.168.1.33:80";
	#	session_ttl = "1h";
	#};
	# Starting on version 0.107.33 this will be used to control the web portal 
    #};
  };

    networking.firewall = {

    # allow Adguard DNS through the firewall
    allowedUDPPorts = [53 67 68 80 443 853 3000];
    allowedTCPPorts = [53 67 68 80 443 853 3000]; #Port 3000 is the default when adguard is first installed
  };


}
