{ ... }:
{
  programs.home-manager.enable = true;

  imports = [
    ./home.nix
    ./xdg.nix

    # programs
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
