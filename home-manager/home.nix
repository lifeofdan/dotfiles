{ config, pkgs, ... }:

{
    home.username = "nixofdan";
    home.homeDirectory = "/home/nixofdan";
    home.stateVersion = "26.05";

    home.packages = with pkgs; [
        neovim
        zsh
    ];

    programs.git = {
        enable = true;
        userName = "Daniel Newman";
        userEmail = "contact@lifeofdan.me";
    };
}
