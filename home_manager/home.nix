{ config, pkgs, ... }:

let 
  name = "Stefan Nyman";
  email = "stefan@precisely.se";
  font = "Hack";
  backgroundColor = "#243442";
  foregroundColor = "#deedf9";
  warningColor = "#e23131";
in
{

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "${name}";
      userEmail = "${email}";
    };
    termite = {
      enable = true;
      font = "${font} 11";
      backgroundColor = "rgba(32, 39, 51, 0.9)";
    };
    go.enable = true;
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "z";
    homeDirectory = "/home/z";
    file = {
      ".inputrc".text =
      ''
set editing-mode vi
set keymap vi-command
      '';
      ".bashrc".text =
      ''
export EDITOR=nvim
export PATH=$PATH:~/bin:~/go/bin
alias gs="git status"
      '';
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
