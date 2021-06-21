set expandtab " insert spaces on tab
set tabstop=2 " number of spaces inserted on tab
set shiftwidth=2 " number of spaces used for indentation
set mouse=a " enable mouse
set conceallevel=0 " conceal hides information for pretty printing
let g:pandoc#syntax#conceal#use = 0 " same, conceal but for pandoc
set nofoldenable " disable folding
set number " show line numbers
set scrolloff=5 " always show five lines above and below cursor
set wrap linebreak nolist " wrap lines

" use space as leader
nnoremap <SPACE> <Nop>
let mapleader=" "

" start with cursor at last known position
augroup vimStartup
au!

autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

augroup END

" tab for trigger completion, completion confirm, snippet expand and jump like VSCode
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
