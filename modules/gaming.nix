{ config, pkgs, lib, ... }:

{
  # Install Steam
  programs.steam.enable = true;  

  # Install Lutris
  environment.systemPackages = with pkgs; [
    lutris
  ];
}
