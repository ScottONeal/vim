set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set background=dark
set nocompatible
set number
syntax on

"==[ Searching ]==
set incsearch    "Lookahead as search pattern specified
set ignorecase   "Ignore case in all searches..
set smartcase    "...unless uppercase letters used
set hlsearch     "High all search matches


"Delete in normal mode to switch off highlighting till next search and clear messages...
nmap <silent> <BS> :nohlsearch <BAR> call Toggle_CursorColumn('off')<CR>

"Double-delete to remove search highlighting *and* trailing whitespace...
nmap <silent> <BS><BS> mz:%s/\s\+$//g<CR>`z:nohlsearch<CR>

"==[ :%s/../../g subsitute ]==
nmap S  :%s//g<LEFT><LEFT>
vmap S  :%s//g<LEFT><LEFT>

au BufNewFile,BufRead *.json set filetype=javascript

"==[ Make Visual modes work better ]==

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

vnoremap v <C-V>
vnoremap <C-V> v

" Make BS/DEL work as expected in visual modes (i.e. delete elected)...
vmap <BS> x

nmap <silent> <F12> :TlistToggle<CR>
set tags=./tags,~/tags
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1

"Square up visual selections...
set virtualedit=block

" When shifting, retain selection over multiple shifts...
vmap <expr> > KeepVisualSelection(">")
vmap <expr> < KeepVisualSelection("<")

function! KeepVisualSelection(cmd)
    if mode() ==# "V"
        return a:cmd . "gv"
    else
        return a:cmd
    endif
endfunction

filetype on

set printoptions=paper:letter,duplex:off,left:5pc,right:5pc,top:5pc,bottom:5pc

:nmap <silent> <C-N> :silent noh<CR>
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
:map aa :tabdo q<CR>
:map ty :tabnext<CR>
:map tr :tabprev<CR>
:map <C-b> :Ex<cr>

au BufNewFile,BufRead *.meta set filetype=perl
au BufNewFile,BufRead *.cgi,*.t set filetype=perl
au BufNewFile,BufRead *.tt setf tt2html
au BufNewFile,BufRead *.yaml,*.yml,*.pg setf yaml 

set pastetoggle=<F2>

"Automatically delete all trailing whitespace
autocmd BufWritePre *.pl,*.pm,*.js :%s/\s\+$//e

:filetype plugin on

colorscheme delek 
