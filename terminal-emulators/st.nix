{pkgs, ...}:

let
  mydrvs = builtins.fetchGit {
    url = "https://github.com/huuff/derivations.git";
    rev = "4b93d7121278ce87e01a033e6e9be84f6b305df1";
  };
in
{
  imports = [
    "${mydrvs}/st/home-st.nix"
    #../../../derivations/st/home-st.nix # for testing purposes
  ];

  programs.st = {
    enable = true;
    colorscheme = "dracula";
    fontSize = 16;
    scrollback = true;
    blinkingCursor = true;
    flags = {
      f = "FiraCode Nerd Font";
    };
  };

}
