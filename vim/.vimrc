 "add tabs as spaces, and make them 4 spaces
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set colorcolumn=80
set mouse=a

"Respect line wrapping
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

filetype plugin on
filetype indent on

"SETUP
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set laststatus=2                    "Enabling statusline at all times
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
set noshowmode                      "Don't show the mode(airline is handling this)

imap jj <Esc>                       " Use jj to leave insert mode
set cursorline                      "Highlight the line the cursor is on
set number                          "Line numbers

" Installs vim-plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
"TPOPE
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'           "Allows git commands
Plug 'tpope/vim-commentary'       "Makes commenting easier
Plug 'tpope/vim-surround'           "Allows changing of surrounding brackets, quotes, etc

Plug 'ctrlpvim/ctrlp.vim'            "Use ctrl-p to switch files

"Airine 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Autoformat
Plug 'chiel92/vim-autoformat'

"Syntax Highlight
Plug 'sheerun/vim-polyglot'

"Style
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'timonv/vim-cargo'

call plug#end()

" Syntastic
"let g:syntastic_error_symbol = 'EE'
"let g:syntastic_style_error_symbol = 'E>'
"let g:syntastic_warning_symbol = 'WW'
"let g:syntastic_style_warning_symbol = 'W>'
"
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_rust_checkers = ['cargo']

"Setting the colorscheme
if &t_Co >= 256 || has("gui_running")
    set background=dark
    if !empty(glob('~/.vim/plugged/vim-colorschemes/'))
        colorscheme gruvbox
    endif
endif
if &t_Co > 2 || has("gui_running")
    "switch syntax highlighting on, when the terminal has colors
    syntax on
endif

"Airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"Ale
let g:airline#extensions#ale#enabled = 1

"AutoFormat
noremap <C-I> :Autoformat<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"Git Gutter
let g:gitgutter_realtime = 1
set updatetime=500

" Force myself to use hjkl
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Autoclosing
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

"""""""""""""
" OPAM CONFIG
"""""""""""""

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
autocmd Filetype ocaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2


