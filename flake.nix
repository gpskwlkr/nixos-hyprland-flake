{
    description = "gpskwlkr NixOS";

    inputs = {
	    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        lanzaboote = {
            url = "github:nix-community/lanzaboote/v0.3.0";

            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, ... }:
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
                    ./hardware-configuration.nix
                    ./system/boot.nix
                    ./system/fonts.nix
                    ./system/gaming.nix
                    ./system/hardware.nix
                    ./system/hyprland.nix
                    ./system/internationalisation.nix
                    ./system/misc.nix
                    ./system/networking.nix
                    ./system/nixsettings.nix
                    ./system/packages.nix
                    ./system/polkit.nix
                    ./system/programming.nix
                    ./system/programs.nix
                    ./system/security.nix
                    ./system/services.nix
                    ./system/sound.nix
                    ./system/time.nix
                    ./system/users.nix
                    ./system/virtualisation.nix
                    ./system/theme.nix 
                    ./system/work.nix

                    lanzaboote.nixosModules.lanzaboote 


                    ({pkgs, lib, ...}: {
                        environment.systemPackages = [
                            pkgs.sbctl
                        ];

                        boot.loader.systemd-boot.enable = lib.mkForce false;

                        boot.lanzaboote = {
                            enable = true;
                            pkiBundle = "/etc/secureboot";
                        };
                     })
				];
                specialArgs = {
                    inherit pkgs-unstable;
                };
        };

		homeConfigurations = {
			gpskwlkr = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
                extraSpecialArgs = {
                    inherit pkgs-unstable;
                };
			};
		};
    };
}
