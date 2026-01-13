{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  
  outputs = { self, nixpkgs }: {
    nixosConfigurations.shadow = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/shadow/configuration.nix
        ./modules/common.nix
        ./modules/desktop.nix
        ./modules/nvidia.nix
        ./modules/users.nix
        ./modules/plasma6.nix
	./modules/gaming.nix
      ];
    };
    nixosConfigurations.meerkat = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/meerkat/configuration.nix
        ./modules/common.nix
        ./modules/server.nix
        ./modules/users.nix
	./modules/frigate.nix
      ];
    };
  };
}
