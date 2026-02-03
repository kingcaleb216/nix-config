{
  description = "Caleb's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      mkHost = hostName: lib.nixosSystem {
        inherit system;
        specialArgs = { inherit self nixpkgs home-manager hostName; };
        modules = [
          ./system/hosts/${hostName}

          home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.caleb = import ./home/modules/common.nix;
          })
        ];
      };
    in
    {
      nixosConfigurations.k1 = mkHost "k1";
    };
}
