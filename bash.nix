{ pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      perms = ''stat -c "%a %n"'';
      ports = ''netstat -tulpn | grep LISTEN'';
      trace-net = ''strace -f -e trace=network'';
      sudo= "sudo "; # https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo/22043#22043 
    };

    # necessary so Nix works on non-NixOS
    initExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
  };

}
