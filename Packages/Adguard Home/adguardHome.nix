{ config, pkgs, ... }:

{

  # enable the adguard home service
  # and allow adguard to open the firewall for web admin acces
  services.adguardhome = {
    enable = true;
    openFirewall = true;
  };

    networking.firewall = {

    # allow Adguard DNS through the firewall
    interfaces.end0.allowedUDPPorts = [ 53 ];
    interfaces.end0.allowedTCPPorts = [ 53 ];
  };


}
