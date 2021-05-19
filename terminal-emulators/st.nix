{pkgs, ...}:

let
  mydrvs = builtins.fetchGit {
    url = "https://github.com/huuff/derivations.git";
    rev = "b6ab1cae602e5d173934ac86825a0f06a6c4e124";
  };
in
{
  imports = [
    "${mydrvs}/st/home-st.nix"
  ];

  programs.st = {
    enable = true;
    colorscheme = "dracula";
    fontSize = 16;
    scrollback = true;
    blinkingCursor = true;
  };

}
