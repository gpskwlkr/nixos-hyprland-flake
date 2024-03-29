{
    imports = [
        ./git.nix
        ./gtk.nix
        ./shell.nix
        ./config.nix
        ./packages.nix
        ./programs.nix
        ./environment.nix
    ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      permittedInsecurePackages = [
        "electron-25.9.0" # Obsidian
      ];
    };
  };
}
