{ pkgs, ... }: 

{
    environment.systemPackages = with pkgs; [
      jetbrains.rider
      obsidian
      teams-for-linux
      thunderbird
      zoom-us    
    ];
}
