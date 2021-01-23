{ config, pkgs, lib, ... }:

{
    imports = [
      ./nvim.nix
    ];

  # Let Home Manager install and manage itself.
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "haf";
  home.homeDirectory = "/home/haf";
  home.sessionVariables.EDITOR = "nvim";

  home.packages = with pkgs; [
    postman
    i3status
    terminus_font
    anki
    zathura
    (texlive.combine {
      inherit (texlive) scheme-basic cancel;
    })
    scrot
    jetbrains.idea-ultimate
    neuron-notes
    (haskellPackages.ghcWithPackages (ps: [ps.ghci]))

    # for classes
    simplescreenrecorder
    google-chrome
    teams
  ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        isDefault = true;
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
    ];
  };

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config.modifier = "Mod4";
      config.window.titlebar = false;
      config.terminal = "alacritty";
      config.menu = "rofi -show run";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 10;
    };
  };

  programs.git = {
    enable = true;
    userName = "Haf";
    userEmail = "haf@protonmail.ch";
  };

  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };

  programs.emacs = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings.add_newline = false;
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
