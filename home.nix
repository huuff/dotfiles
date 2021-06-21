{ config, pkgs, lib, ... }:
let
  mydrvs = builtins.fetchGit "https://github.com/huuff/derivations.git";
in
{
    imports = [
      ./editors/nvim.nix
      ./editors/doom-emacs.nix
      #./editors/emacs.nix

      ./browsers/firefox.nix
      # ./browsers/surf.nix

      ./terminal-emulators/st.nix
      ./terminal-emulators/alacritty.nix

      "${mydrvs}/scripts.nix"
      "${mydrvs}/autocutsel.nix"

      ./git.nix
      ./bash.nix
      ./starship.nix
      ./i3.nix

      # for when I'm making tests with these
      #../../derivations/scripts.nix
      #../../derivations/autocutsel.nix
    ];


  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.fzf.enable = true;

  haf.scripts.enable = true;
  haf.autocutsel.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "haf";
  home.homeDirectory = "/home/haf";
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    anki
    zathura
    scrot
    jetbrains.idea-ultimate
    xclip
    cloc
    nixpkgs-fmt
    nix-prefetch-git

    simplescreenrecorder
    google-chrome
    teams
  ] ++ import ./cli-essentials.nix { inherit pkgs; } ;


  programs.mpv = {
    enable = true;
    config = {
      save-position-on-quit = true;
    };
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
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
