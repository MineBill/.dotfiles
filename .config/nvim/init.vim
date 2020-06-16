" ___  ____           ______ _ _ _ 
" |  \/  (_)          | ___ (_) | |
" | .  . |_ _ __   ___| |_/ /_| | |
" | |\/| | | '_ \ / _ \ ___ \ | | |
" | |  | | | | | |  __/ |_/ / | | |
" \_|  |_/_|_| |_|\___\____/|_|_|_|
"
" === Basic nvim Configuration === {

filetype plugin indent on
set hidden
set number
set relativenumber
set cursorline
set showcmd
set encoding=utf-8
 
set incsearch
set title
set noswapfile
set nobackup
set nowb

set undodir=~/.vimundo
set undofile

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set tabstop=4
set noexpandtab
"set termguicolors
set guifont=Mononoki:h16

set nowrap
set linebreak

" }

" ==== Plugins ======================================================== {

" Needs to be before ale download
let g:ale_completion_enabled = 0

if has('vim_starting')
  set runtimepath+=/home/minebill/.vim/bundle/Vundle.vim
endif

call plug#begin('/home/minebill/.vim/plugged')
Plug 'akiyosi/gonvim-fuzzy'
Plug 'dag/vim-fish'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'petrbroz/vim-glsl'
Plug 'frazrepo/vim-rainbow'
Plug 'yggdroot/indentline'
Plug 'airblade/vim-rooter'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deol.nvim'
call plug#end()

"colorscheme Atelier_DuneDark
colorscheme obsidian

" }

" === Settings ========================================================= {

set foldmethod=marker
set foldmarker={,}
set foldlevelstart=20

let g:coc_force_debug = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" {
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }


" == NERDTree Settings ==
let g:NERDTreeWinSize = 20

" == Vim-Rainbow ==
let g:rainbow_active = 1

" == Ale Settings ==
let g:ale_linters = {'rust': ['analyzer']}
" }

" === Keybinds ========================================================= {
let mapleader = " "
inoremap fd <Esc>

nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>feR :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>so :source %<CR>

" == Searching Keybinds ==
nnoremap <C-n> :noh<CR>
nnoremap n nzz
nnoremap N Nzz

" == Insert Mode Editing Keybinds ==
" TODO: Try now to use it
imap <C-BS> <C-W>

" == Editing Keybinds ==
nnoremap <C-O> o<Esc>k
nnoremap <S-O> O<Esc>j

nnoremap m :NERDTreeToggle<CR>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
noremap <S-Tab> :bn<CR>
noremap <C-Tab> :bp<CR>

" == ALE Keybinds ==
map <Leader>gt :ALEGoToDefinition<CR>
map <Leader>gr :ALEFindReferences<CR>

nnoremap <Leader>gh :call CocActionAsync('doHover')<CR>
" noremap <C-S-Tab> :bp<CR>

" }

nnoremap <F9> :call CargoRun("build")<CR>
nnoremap <F10> :call CargoRun("run")<CR>
nnoremap <F11> :call CargoRun("clippy")<CR>
function CargoRun(cmd)
	botright split CargoRunner
	resize 12
	setlocal buftype=nofile bufhidden=delete nobuflisted nolist nomodifiable
		\ noswapfile
		\ nowrap
		\ cursorline
		\ nospell
		\ nonu
		\ norelativenumber
		\ winfixheight
	set filetype=CargoRunner
	exec 'terminal cargo ' . a:cmd
	nnoremap <silent><buffer> q :call RunnerClose()<CR>
	"nnoremap <silent><buffer> q :bd!<CR>
	normal! G
endfunction

function RunnerClose()
	exec 'bd!'
	exec 'wincmd p'
endfunction
