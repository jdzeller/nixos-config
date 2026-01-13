{ config, pkgs, lib, ... }:

{
  fileSystems."/media/frigate" = {
    device = "192.168.1.8:/mnt/user/frigate";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "rw" ];
  };
}
