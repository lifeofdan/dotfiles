{
  lib,
  config,
  pkgs,
  ...
}:

{
  home.username = "nixofdan";
  home.homeDirectory = "/home/nixofdan";
  home.stateVersion = "26.05";

  # Add session paths for mason
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/nvim/mason/staging/nil/bin"
  ];

  home.packages = with pkgs; [
    neovim
    rustc
    cargo
    gcc
    zsh
    wezterm
    rofi
    waybar
    lazygit
  ];

  home.file = {
    ".config/hypr/hyprland.lua" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hyprland/hyprland.lua";
    };
  };

  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Mocha";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Daniel Newman";
        email = "contact@lifeofdan.me";
      };
    };
  };
}
