{
    description = "gpskwlkr NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        firefox-addons = {
            url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        lanzaboote = {
            url = "github:nix-community/lanzaboote/v0.3.0";

            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, ... }@inputs:
	let 
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
	in
    {
		nixosConfigurations.nixos-personal = lib.nixosSystem {
                inherit system;
				modules = [
                    ./configuration.nix 
                    lanzaboote.nixosModules.lanzaboote 
				];
                specialArgs = {
                    inherit pkgs-unstable;
                };
        };

		homeConfigurations = {
			gpskwlkr = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home ];
                extraSpecialArgs = {
                    inherit pkgs-unstable;
                    inherit inputs;
                };
			};
		};
    };
}
