{ config, pkgs, ... }:

{
  #imports = [
   # ./autoAuth.nix
  #];

  # make the tailscale command usable to users
  users.users.crawford.packages = with pkgs; [ tailscale ];

  # enable the tailscale service
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

    networking.nameservers = [ "100.100.100.100" "1.1.1.1" "8.8.8.8"];
    networking.search = [ "tail386c1.ts.net" ];

    networking.firewall = {
    # enable the firewall (By default true)
    enable = true;

    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # allow you to SSH in over the public internet
    #allowedTCPPorts = [ 22 ];
  };


}
