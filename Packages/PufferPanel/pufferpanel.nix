{ lib, pkgs, ... }: {
  services.pufferpanel = {
    enable = true;
    extraPackages = pkgs: (with pkgs; [ bash curl gawk gnutar gzip ]);
    package = pkgs.buildFHSEnv {
      name = "pufferpanel-fhs";
      runScript = lib.getExe pkgs.pufferpanel;
      targetPkgs = pkgs: (with pkgs; [ icu openssl zlib ]);
    };
  };
}
