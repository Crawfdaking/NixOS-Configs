{config, pkgs, lib}:


{

    
    services.unbound = {
        enable = true;
        resolveLocalQueries = false;
         server = {
            verbosity = 0;
            interface = [ "127.0.0.1" ];
            port = 5335;
            do-ip4 = true;
            do-udp = true;
            do-tcp = true;
            do-ip6 = false;
            harden-glue = true;
            harden-dnssec-stripped = true;
            use-caps-for-id = false;
            edns-buffer-size = 1232;
            prefetch = true;
            num-threads = 1;
            so-rcvbuf = "1m";
            private-address = ["192.168.0.0/16" "10.0.0.0/8"];
         };
    };








}
