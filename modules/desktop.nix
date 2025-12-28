{ config, pkgs, lib, ... }:

{
  # Enable networkmanager openconnect 
  networking.networkmanager.plugins = with pkgs; [ networkmanager-openconnect ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Desktop Applications and packages 
  programs.firefox.enable = true;
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "jzeller" ];
  };
  programs.vscode.enable = true;
  programs.partition-manager.enable = true;
  programs.steam.enable = true;  
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    papirus-icon-theme
  ];
}
