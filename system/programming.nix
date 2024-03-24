{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [
    dotnet-runtime_8
    dotnet-sdk_8
    dotnetPackages.Nuget
    gcc
    go
    lua
    nodejs_21
    nodePackages.pnpm
    (python3.withPackages (python-pkgs: [
        python-pkgs.pip
        python-pkgs.requests
    ]))
    zig  
  ];
}
