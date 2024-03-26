{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      permittedInsecurePackages = [
        "electron-25.9.0" # Obsidian
      ];
    };
  };

  home.packages = [

    # Dev stuff
    pkgs.jetbrains.rider
    pkgs.dotnet-sdk_8
    pkgs.dotnetPackages.Nuget
    pkgs.gcc
    pkgs.go
    pkgs.lua
    pkgs.nodejs_21
    pkgs.nodePackages.pnpm
    (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))
    pkgs.zig

    # Work stuff
    pkgs.obsidian
    pkgs.teams-for-linux
    pkgs.thunderbird
    pkgs.zoom-us
 
    # Bluetooth
    pkgs.blueberry

    # Social
    pkgs.telegram-desktop
    pkgs-unstable.vesktop

    # Gaming
    pkgs.steam
    pkgs.steam-run
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        pkgs.wineWowPackages.stable
        pkgs.winetricks
      ];
    })

    # Downloads
    pkgs.qbittorrent

    # Utils
    pkgs-unstable.hyprshot
  ];
}
