{ config, pkgs, lib, ... }:
# TODO: Less hackiness on my modules
# I should be able to import all of my derivations repo
# and then enable whichever I want
# but I haven't found how so this is my current solution
let
  mydrvs = builtins.fetchGit "https://github.com/huuff/derivations.git";
in
{
    imports = [
      ./nvim.nix
      ./doom-emacs.nix
      ./browsers/firefox.nix
      ./browsers/surf.nix
      ./terminal-emulators/st.nix
      #./emacs.nix
      "${mydrvs}/scripts.nix"
      "${mydrvs}/autocutsel.nix"
      #../../derivations/scripts.nix
      #../../derivations/autocutsel.nix
      #../../derivations/home-st.nix
      #"${mydrvs}/blesh/home-blesh.nix"
    ];


  # Let Home Manager install and manage itself.
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  programs.bash.enable = true;
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;

  haf.scripts.enable = true;
  haf.autocutsel.enable = true;

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
      inherit (texlive) scheme-basic;
    })
    scrot
    jetbrains.idea-ultimate
    (haskellPackages.ghcWithPackages (ps: [ps.ghci]))
    xclip
    cloc
    stack
    fd
    bat
    nixpkgs-fmt

    # for classes
    simplescreenrecorder
    google-chrome
    teams
  ];

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
      font.size = 9;
    };
  };

  programs.git = {
    enable = true;
    userName = "Haf";
    userEmail = "haf@protonmail.ch";
    extraConfig = {
      credential.helper = "cache --timeout=3600";
      #init.defaultBranch = "main";
    };
  };

  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };

  programs.starship = {
    enable = true;
    settings.add_newline = false;
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
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
