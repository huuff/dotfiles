{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "lsd";
    };

    # necessary so Nix works on non-NixOS
    initExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
  };

}
