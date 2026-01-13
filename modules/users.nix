{ config, pkgs, lib, ... }:

{
  users.users.jzeller = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };
}
