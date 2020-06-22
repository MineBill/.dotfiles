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
set termguicolors
set colorcolumn=100

set nowrap
set linebreak

autocmd BufNewFile,BufRead i3config set ft=i3config
"augroup RUST_SETTINGS
	"autocmd!
	"autocmd FileType rust autocmd BufWritePre <buffer> :RustFmt
"augroup END

if has("nvim")
	set guifont=Fira\ Code:h18
	"set guifont=InputCode:h21
	"set guifont=Mononoki:h21

	let g:neovide_refresh_rate = 140
	let g:neovide_cursor_animation_length = 0
	let g:neovide_cursor_trail_length = 0
	let g:neovide_cursor_antialiasing = v:false
	let g:neovide_transparency = 1
end

" }

" ==== Plugins ============================================================== {

if has('vim_starting')
  set runtimepath+=/home/minebill/.vim/bundle/Vundle.vim
endif

call plug#begin('/home/minebill/.config/nvim/plugged')
Plug 'ron-rs/ron.vim'
Plug 'vim-crystal/vim-crystal'
Plug 'alaviss/nim.nvim'
Plug 'chriskempson/base16-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'doums/darcula'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'lervag/vimtex'
Plug 'lilydjwg/colorizer'
Plug 'mboughaba/i3config.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'kyoz/purify', {'rtp': 'vim'}
Plug 'clktmr/vim-gdscript3'
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-startify'
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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deol.nvim'
call plug#end()

source ~/.config/nvim/plugin/cargorun.vim

"colorscheme OceanicNext
colorscheme base16-tomorrow-night-eighties
"let g:airline_theme='one'
"call one#highlight('Normal', '','242424', 'none')

" }

" === Settings ============================================================== {
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_hightlight = 1
let g:cpp_posix_standard = 1

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


" == NERD Tree Settings ==
let g:NERDTreeWinSize = 20

let g:goyo_width = 130
let g:goyo_height = '90%'

" == Vim-Rainbow ==
let g:rainbow_active = 1

" == Ale Settings ==
let g:ale_linters = {'rust': ['analyzer']}

" }

" === Key binds ============================================================= {
let mapleader = " "
inoremap fd <Esc>
nnoremap ; :
nnoremap : ;

nnoremap η h
nnoremap ξ j
nnoremap κ k
nnoremap λ l
nnoremap φδ <Esc>

nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>feR :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>so :source %<CR>

" == Searching Key binds ==
nnoremap <C-n> :noh<CR>
nnoremap n nzz
nnoremap N Nzz

" == Insert Mode Editing Key binds ==
" TODO: Try now to use it
imap <C-BS> <C-W>

"== Editing Keybinds ==
nnoremap <C-O> o<Esc>k
"nnoremap <C-S-O> O<Esc>j


nnoremap m :NERDTreeToggle<CR>

nnoremap <Leader>zz :Goyo<CR>

inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-P>" : "\<Tab>"
noremap <S-Tab> :bn<CR>
noremap <C-Tab> :bp<CR>

" == ALE Key binds ==
nnoremap <Leader>gt :ALEGoToDefinition<CR>
nnoremap <Leader>gr :ALEFindReferences<CR>
nnoremap <Leader>fe :ALEFirst<CR>
nnoremap <Leader>ee :ALENext<CR>

nnoremap <Leader>fmt :RustFmt<CR>

nnoremap <Leader>gh :call CocActionAsync('doHover')<CR>
" noremap <C-S-Tab> :bp<CR>

" }
nnoremap <F5> :call SimpleTerm()<CR>

nnoremap <F9> :call CargoRun("build", "", "")<CR>
nnoremap <F10> :call CargoRun("run", "", "")<CR>
nnoremap <F11> :call CargoRun("clippy", "", "")<CR>
" {

let $FZF_DEFAULT_OPTS = '--layout=reverse'
let g:fzf_layout = { 'window': 'call OpenFloatingSearch()' }
nnoremap <Leader>fff :Files<CR>

function! OpenFloatingSearch()
	let height = &lines - 3
	let width = float2nr(&columns - (&columns * 2 / 10))
	let col = float2nr((&columns - width) - 2)

	let opts = {
	\	'relative': 'editor',
	\	'row': height * 0.3,
	\	'col': col + 7,
	\	'width': width * 2 / 3,
	\	'height': height / 2
	\}

	let buf = nvim_create_buf(v:false, v:true)
	let win = nvim_open_win(buf, v:true, opts)

	call setwinvar(win, '&winhl', 'Normal:Pmenu')

	setlocal
		\ buftype=nofile
		\ nobuflisted
		\ bufhidden=hide
		\ nonumber
		\ norelativenumber
		\ signcolumn=no
endfunction
