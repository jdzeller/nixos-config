{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };
  
  outputs = { self, nixpkgs }: {
    nixosConfigurations.shadow = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/shadow/configuration.nix
        ./modules/nvidia.nix
        ./modules/users.nix
      ];
    };
  };
}
