{pkgs, ...}:

let
  mydrvs = builtins.fetchGit {
    url = "https://github.com/huuff/derivations.git";
    rev = "97c8e70e6aea747161ebb456e489a6988b668438";
  };
in
{
  imports = [
    #"${mydrvs}/st/home-st.nix"
    ../../../derivations/st/home-st.nix
  ];

  programs.st = {
    enable = true;
    colorscheme = "dracula";
    fontSize = 14;
    scrollback = true;
    blinkingCursor = true;
  };

}
