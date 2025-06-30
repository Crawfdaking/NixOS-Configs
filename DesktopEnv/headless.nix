{ config, pkgs, lib, ... }:
{
  #systemd.services."getty@tty1".enable = false;
  #systemd.services."getty@tty2".enable = false;
  #systemd.services."autovt@tty1".enable = false;
  #services.logind.extraConfig = "NAutoVTs=0" /*ReserveVT=0*/;
  #boot.kernelParams = ["consoleblank=3"];
  #i8042.nokbd video=LVDS-1:d
  boot.kernelParams = ["consoleblank=1"];
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
}
