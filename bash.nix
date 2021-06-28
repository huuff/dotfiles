{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      perms = ''stat -c "%a %n"'';
      ports = ''netstat -tulpn | grep LISTEN'';
      trace-net = ''strace -f -e trace=network'';
    };

    # necessary so Nix works on non-NixOS
    initExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
  };

}
