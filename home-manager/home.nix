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
      settings = {
        user {
          name = "Daniel Newman";
          email = "contact@lifeofdan.me"
        };
      };
    };
}
