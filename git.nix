{ pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "Haf";
    userEmail = "haf@protonmail.ch";
    ignores = [ "*~" "*.swp" ];
    extraConfig = {
      credential.helper = "cache --timeout=3600";
      init.defaultBranch = "master";
      pull.rebase = "false";
    };
  };

}
