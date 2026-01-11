{ config, pkgs, lib, ... }:

{
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Don't show bootloader countdown
  boot.loader.timeout = 0;

  # Enable Plymouth at boot
  boot.plymouth.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Common programs and packages
  nixpkgs.config.allowUnfree = true;

  programs.git.enable = true;
  programs.neovim.enable = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  programs.htop.enable = true;

  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    fastfetch
  ];
}
