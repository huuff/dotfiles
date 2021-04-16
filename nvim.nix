{pkgs, ...}:

{
  programs.neovim = {
    enable = true;

    extraConfig = builtins.readFile ./config.vim;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-surround
      targets-vim
      mkdx
      fzf-vim
      coc-nvim
      coc-snippets
      nerdcommenter
      fugitive
      vim-gitgutter
      vim-repeat
      vim-sneak
      vim-pandoc
      vim-pandoc-syntax
    ];
  };

  xdg.configFile."nvim/coc-settings.json".text = builtins.readFile ./my-coc-settings.json;
}
