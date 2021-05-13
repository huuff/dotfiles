{pkgs, ...}:

let
  mydrvs = builtins.fetchGit {
    url = "https://github.com/huuff/derivations.git";
    rev = "97c8e70e6aea747161ebb456e489a6988b668438";
  };
in
{
  imports = [
    "${mydrvs}/st/home-st.nix"
  ];

  nixpkgs.overlays = [ (import "${mydrvs}/st/st-patches-overlay.nix") ];

  haf.st = {
    enable = true;
    patches = with pkgs; [ 
      stPatches.dracula 
      stPatches.blinkingCursor
      stPatches.defaultFontSize
    ];
  };

  # This doesn't work! why?
  programs.bash.shellAliases = {
    st = "${pkgs.st}/bin/st -z 32";
  };
}
