{pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set expandtab " insert spaces on tab
      set tabstop=2 " number of spaces inserted on tab
      set shiftwidth=2 " number of spaces used for indentation
      set mouse=a " enable mouse
      set conceallevel=2 " hides information (using on vim-markdown)
      set number " show line numbers
      set scrolloff=5 " always show five lines above and below cursor
      set wrap linebreak nolist " wrap lines

      " use space as leader
      nnoremap <SPACE> <Nop>
      let mapleader=" "

      augroup vimStartup
      au!

      " When editing a file, always jump to the last known cursor position.
      " Don't do it when the position is invalid, when inside an event handler
      " (happens when dropping a file on gvim) and for a commit message (it's
      " likely a different one than last time).
      autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

      augroup END
    '';

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-surround
      targets-vim
      mkdx
      fzf-vim
      coc-nvim
      nerdcommenter
      fugitive
      vim-gitgutter
      vim-repeat
      vim-sneak
    ];
  };

  xdg.configFile."nvim/coc-settings.json".text = builtins.readFile ./my-coc-settings.json;
}
