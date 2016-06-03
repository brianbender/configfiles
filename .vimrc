set t_Co=256
set mouse=a
set number
set showtabline=2
set wildmenu
set wildmode=list:longest,full
set showmode
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set scrolloff=2
set autoindent
"set smartindent
set shiftwidth=2
"set cindent
set expandtab
set softtabstop=2
set nowrap
set ttyfast
set textwidth=80
set colorcolumn=+1
let lpc_syntax_for_c = 1
autocmd FileType c set filetype=lpc

colorscheme molokai
if &diff
colorscheme default
hi Search term=none ctermbg=yellow ctermfg=black guibg=Yellow
hi Visual term=none ctermbg=236 guibg=LightGrey
hi DiffAdd term=none cterm=none ctermbg=234
hi DiffDelete term=none cterm=none ctermbg=darkred ctermbg=234
hi DiffChange term=none cterm=none ctermbg=black
hi DiffText term=none ctermbg=235
endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
imap jk <ESC>
imap Jk <ESC>
imap JK <ESC>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
map <F10> <Esc>:set number!<CR>
map <F11> <Esc>:set list!<CR>
map <F8> <Esc>:setlocal spell!<CR>
map <F7> <Esc>:if exists("syntax_on") <Bar>
   \   syntax off <Bar>
   \ else <Bar>
   \   syntax enable <Bar>
   \ endif <CR>
map:W :w
map:WQi :wq
map:wQ :wq
map:Q :q

vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name=inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>private " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal=j0w
endfunction
