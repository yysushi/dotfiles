{ config, ... }:
let
  homePath = builtins.toString ../..;
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      cat = "bat";
    };
    autocd = true;
    sessionVariables = {
      SHELDON_CONFIG_FILE = "${config.xdg.configHome}/sheldon/plugins.toml";
      SHELDON_DATA_DIR = "${config.xdg.dataHome}/sheldon";
    };
    profileExtra = ''
      DISPLAY="$(grep nameserver /etc/resolv.conf | awk '{print $2}'):0"
      bindkey -v
      setopt no_beep
      bindkey '^N' autosuggest-accept
      . "${homePath}/.dotfiles/agkozak_prompt.zsh"
    '';
    initExtra = ''
      eval "$(sheldon source)"
    '';
  };
  programs.zoxide.enable = true;
}