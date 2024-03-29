{ pkgs, ... }:
{
  imports = [
    <home-manager/nix-darwin>

    ./keyboard.nix
    ./homebrew.nix
  ];

  environment = {
    darwinConfig = /Users/y-tsuji/.config/nixpkgs/darwin/configuration.nix;
    systemPackages = [
      pkgs.alacritty
      pkgs.zsh
    ];
    shells = [ pkgs.zsh ];
  };
  services.nix-daemon.enable = true;

  nix = {
    settings.auto-optimise-store = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  fonts = {
    fontDir.enable = true;
    # enableGhostscriptFonts = true;
    fonts = with pkgs; [
      source-code-pro
      # emojione
    ];
  };

  users.users."y-tsuji" = {
    name = "y-tsuji";
    home = "/Users/y-tsuji";
  };
  home-manager.users."y-tsuji" = (import /Users/y-tsuji/.dotfiles/nixpkgs/home-manager.nix);
}
