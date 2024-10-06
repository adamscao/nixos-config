{ config, pkgs, ... }:

{
  home.username = "adams";
  home.homeDirectory = "/home/adams";

  home.packages = with pkgs;[
    neofetch
    p7zip
    btop
  ];

  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;
}

