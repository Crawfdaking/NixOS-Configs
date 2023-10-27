{ config, pkgs, ... }:

{

  # enable the adguard home service
  services.adguardhome = {
    enable = true;
  };

    networking.firewall = {

    # allow Adguard DNS through the firewall
    allowedUDPPorts = [ 53 67 68];
    allowedTCPPorts = [ 53 80]; #Port 3000 is the default when adguard is first installed
  };


}
