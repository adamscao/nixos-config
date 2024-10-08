{
  description = "NixOS VM on system76";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations.nixosvmon76 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs;};
      modules = [
        ./configuration.nix
        ./modules/desktop/default.nix

	home-manager.nixosModules.home-manager
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.adams = import ./home.nix;

	  #home-manager.extraSpecialArgs = inputs;
	}
      ];
    };
  };
}
