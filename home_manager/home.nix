{ config, pkgs, ... }:

let 
  name = "Stefan Nyman";
  email = "stefan@precisely.se";
  font = "Hack";
  backgroundColor = "#243442";
  foregroundColor = "#deedf9";
  warningColor = "#e23131";
  dotfileDir = "/home/z/nixconfig";
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
    bash = {
      enable = true;
      shellAliases = {
        "ga" = "git add";
	"gc" = "git commit";
	"gd" = "git diff";
	"gdc" = "git diff --cached";
	"gs" = "git status";
	"gp" = "git push";
	"glg" = "git log --color --graph --pretty --oneline";
	"glgb" = "git log --all --graph --decorate --oneline --simplify-by-decoration";
      };
    };
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "z";
    homeDirectory = "/home/z";
    file = {
    };
  };

  xdg.configFile."bspwm/bspwmrc".source = "${dotfileDir}/bspwm/bspwmrc";
  xdg.configFile."sxhkd/sxhkdrc".source = "${dotfileDir}/sxhkd/sxhkdrc";

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
