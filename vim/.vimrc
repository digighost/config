set nocompatible " must be first line

"disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" in all modes (:map and :noremap), one that works in normal mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap)

" pathogen. the next two lines verify if ~/.vim/bundle/ works correctly
runtime! autoload/pathogen.vim
silent! call pathogen\#helptags()
silent! call pathogen#infect()

let mapleader = "\\"

" For mans
let $PAGER='' " to use vim as man viewver cf .bashrc
runtime! ftplugin/man.vim " enable man viewver on vim

" middle-click paste
map! <S-Insert> <MiddleMouse>

" buffers
map	<C-d>		:BuffergatorToggle<CR>
map	<C-a>		:UndotreeToggle<cr>
map	<F4>		:TagbarToggle<CR>
map	<C-e>		:NERDTreeToggle<CR>:NERDTreeMirror<CR>
map	<C-s>		<Esc>:w<CR>a
map	<leader>e	:NERDTreeFind<CR>
nmap	<leader>nt	:NERDTreeFind<CR>

map	<A-Left>	:tabprev<CR>
map	<A-Right>	:tabnext<CR>

map	<leader>ba	:1,1000 bd!<cr> " Close all the buffers"
map	<C-q>		:bd

map	<C-t>		:tabnew<cr>
map	<Leader>to	:tabonly<cr>
map	<Leader>tc	:tabclose<cr>
map	<Leader>tm	:tabmove<cr>
map	<leader>te	:tabedit <c-r>=expand("%:p:h")<cr> " Opens a new tab with the current buffer's path

" switch screen
map <A-Down>		<C-W>j<C-W>_
map <A-Up>		<C-W>k<C-W>_
map <A-Right>		<C-W>l<C-W>_
map <A-Left>		<C-W>h<C-W>_

" Switch buffer
map <C-Right>		:bnext<cr>
map <C-Left>		:bprevious<cr>
" switch tabs
map <C-Up>		:tabnext<cr>
map <C-Down>		:tabprevious<cr>

noremap <Leader>cd	:lcd %:h<CR>:pwd<CR>
" fugitive shortcuts
noremap <Leader>gs	:Gstatus<CR>
noremap <Leader>gc	:Gcommit<CR>
noremap <Leader>ga	:Gwrite<CR>
noremap <Leader>gl	:!git lg<CR> ":Glog<CR>
noremap <Leader>gd	:Gdiff<CR>
noremap <Leader>gb	:Gblame<CR>

noremap <Leader>q	:bd<CR>

noremap <Leader>/	:noh<CR> " reinit search

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Définit le répertoire de sauvegarde
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

set shell=bash " define the shell
set shellcmdflag=-ic " load .bashrc

set t_Co=256
set background=light

""""""
"set showmode " Display the current mode
"set cursorline " Highlight current line

highlight clear SignColumn " SignColumn should match background for
highlight clear LineNr " Current line number row will have same background color in relative mode.

" always show status bar
if has('statusline')
  set laststatus=2 " call airline statusline
endif

let g:airline_theme = 'powerlineish'

" let g:airline_powerline_fonts=1
" set guifont="Pragmata Pro"
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" Use the default set of separators with a few customizations
let g:airline#extensions#tabline#enabled = 1 "Automatically displays all buffers when there's only one tab open.

if !exists('g:airline_powerline_fonts')
  let g:airline_left_sep='›' " Slightly fancier than '>'
  let g:airline_right_sep='‹' " Slightly fancier than '<'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
endif

"let g:airline_section_b = '%{strftime("%c")}'

" Open new split panes to right and bottom, which feels more natural than Vim's default.
set splitbelow
set splitright

" status line if airline is not set
" set statusline=%<%f\ " Filename
" set statusline+=%w%h%m%r " Options
" set statusline+=%{fugitive#statusline()} " Git Hotness
" set statusline+=%{SyntasticStatuslineFlag()
" set statusline+=\ [%{&ff}/%Y] " Filetype
" set statusline+=\ [%{getcwd()}] " Current dir
" set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info

filetype plugin on
set title
set smartindent
set autoindent " Indent at the same level of the previous line
set shiftwidth=2 " Use indents of 4 spaces
set expandtab " Tabs are spaces, not tabs
set cindent
set tabstop=8 " An indentation every x columns
set softtabstop=2 " Let backspace delete indent
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current
set cursorline
set backspace=indent,eol,start " Backspace for dummies
set linespace=0 " No extra spaces between rows
set nu " Line numbers on
set showmatch " Show matching brackets/parenthesis
set incsearch " Find as you type search
set hlsearch " Highlight search terms
set winminheight=0 " Windows can be 0 line high
set ignorecase " Case insensitive search
set smartcase " Case sensitive when uc present
set whichwrap=b,s,h,l,<,>,[,] " Backspace and cursor keys wrap too
set scrolljump=5 " Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set foldmethod=syntax
set foldenable " Auto fold code
set foldnestmax=1
set nofoldenable
set list
set gdefault " put /g flag on :s substitutions
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" set autowrite " write the file when leaving a modified buffer
set hidden                          " Allow buffer switching without saving

set wildmenu " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.

" Theme
syntax on
syntax sync fromstart

let g:molokai_original = 1
colorscheme molokai

" override some highlight settings (turn off stupid italics in Molokai)
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight CursorLine ctermbg=235 guibg=#2c2d27
highlight CursorColumn ctermbg=235 guibg=#2c2d27
highlight DiffText gui=none
highlight Macro gui=none
highlight SpecialKey gui=none
highlight Special gui=none
highlight StorageClass gui=none
highlight Tag gui=none

" Definit l'espace avant les numéros
set numberwidth=5

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*

" Définit le nombre de commande dans l'historique
set history=100
set mouse=a
set mousemodel=popup " right-click pops up context menu
" Affiche toujours 10 lignes avant et après le curseur
set scrolloff=10

" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=<,>,[,]

" Applique automatiquement les modifications du .vimrc
if has("autocmd")
     autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Sauvegarde de secours des fichiers dans ~/.vim/backup
" ----------------------------------------
" Crée le répertoire de sauvegarde s'il n'existe pas
if !filewritable($HOME."/.vim/backup")
     call mkdir($HOME."/.vim/backup", "p")
endif

" Active la sauvegarde
set backup

highlight ExtraWhitespaces ctermbg=RED guibg=#A00000
highlight ExtraCaractere ctermbg=124 guibg=#A00000

"""""" NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" Auto open nerd tree on startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" Focus in the main content window
let g:nerdtree_tabs_focus_on_files = 1

"""""" End NerdTree
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ================================================== Aucocomplete

 " Ctags {
  set tags+=./tags/,~/.vimtags

  " Make tags placed in .git/tags file available in all levels of a repository
 " let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
  "if gitroot != ''
 "   let &tags = &tags . ',' . gitroot . '/.git/tags'
 " endif

  set nocp
  set tags+=~/.vim/tags/cpp
  "set tags+=~/.vim/tags/gl
  "set tags+=~/.vim/tags/sdl
  "set tags+=~/.vim/tags/qt4
" }

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

  " Define keyword.
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif

  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap <expr><C-g>     neocomplcache#undo_completion()
  inoremap <expr><C-l>     neocomplcache#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
"  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
  endfunction

   " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>  neocomplcache#close_popup()
  inoremap <expr><C-e>  neocomplcache#cancel_popup()
  "let g:neocomplcache_enable_cursor_hold_i = 1

  " Enable omni completion.
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
   " let g:neocomplcache_omni_patterns = {}
  endif
  "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " build tags of your own project with CTRL+F12
  "map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
   noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
   inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>





function! UpdateHeaderDate()
  let save_cursor  = getpos(".")
  let la = "## Last update  @@MDATE@@ lefloc_l"
  let la = substitute(la, "@@MDATE@@", strftime("%a %b %d %H:%M:%S %Y"), "ge")
  let la = substitute(la, "@@MAUTHOR@@", "lefloc_l", "ge")
  execute "silent %s,^## Last update.*," . la . ",ge"
  let lu = "** Last update @@MDATE@@ @@MAUTHOR@@"
  let lu = substitute(lu, "@@MDATE@@", strftime("%a %b %d %H:%M:%S %Y"), "ge")
  let lu = substitute(lu, "@@MAUTHOR@@", "lefloc_l", "ge")
  execute "silent %s,^\*\* Last update.*," . lu . ",ge"
  call setpos('.', save_cursor)
endfunction


function! SetHeader()
  let save_cursor  = getpos(".")
  execute "%s,@@FNAME@@," . expand("%:t") . ",ge"
  execute "silent %s,@@HDR_NAME@@," . toupper(substitute(expand("%:t"),'\..*$',  "","ge")) . ",ge"
  execute "%s,@@PNAME@@," . substitute(substitute(expand("%:p"),'/[^/]*$', "","ge"), "^.*/", "", "ge") . ",ge"
  execute "%s,@@FPATH@@," . substitute(expand("%:p"), '/[^/]*$', "", "ge") . ",ge"
  execute "%s,@@AUTHOR@@," . $NAME . ",ge"
  execute "%s,@@AUTHORMAIL@@,lefloc_l@epitech.eu,ge"
  execute "%s,@@CDATE@@," . strftime("%a %b %d %H:%M:%S %Y") . ",ge"
  call setpos('.', save_cursor)
endfunction


function! Epi_CHHeader_Insert()
  0r ~/.vim/c_hdr_epi.tpl
  call SetHeader()
  call UpdateHeaderDate()
  normal G
  normal dd
  let save_cursor = getpos(".")
  let save_cursor[1] = save_cursor[1] - 2
  call setpos(".", save_cursor)
endfunction

function! Epi_CHeader_Insert()
  0r ~/.vim/c_epi.tpl
  call SetHeader()
  call UpdateHeaderDate()
  normal G
endfunction

function! SetCours()
  let save_cursor  = getpos(".")
  execute "%s,@@FNAME@@," . substitute(expand("%:t:r"), '/[^/]*$', "", "ge") . ",ge"
  execute "%s,@@CDATE@@," . strftime("%a %b %d %H:%M:%S %Y") . ",ge"
endfunction

function! Create_cours_Insert()
  0r ~/.vim/cours.tpl
  call SetCours()
  normal G
endfunction

function! Create_class(name)
  r ~/.vim/cpp_class.tpl
  execute "%s,@@NAME@@," . a:name . ","
endfunction

au BufNewFile {*.h{,h}} call Epi_CHHeader_Insert()
au BufNewFile {*.{c{,c,++,pp},h{,h,pp}},Makefile} call Epi_CHeader_Insert()
au BufWritePre {*.{c{,c,++,pp},h{,h,pp}},Makefile} call UpdateHeaderDate()

  " Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e



au BufNewFile {*.cours} call Create_cours_Insert()

" change color for the colorcolumn
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" change color for the current column number
hi CursorLineNr   term=bold ctermfg=Red gui=bold guifg=Red
au BufNewFile,BufRead {*.{c,h,cpp,hh,cours}} set colorcolumn=80

" met en rouges les chars. depassant la 80e col.
 let ext = expand("%:e")
 if (ext == "h" || ext == "c")
   set comments=sr:/*,mb:**,ex:*/ " it seems it doesn't work when
   set showfulltag     " when completing by tag, show the whole tag
   highlight OverLength ctermfg=red guibg=#592929
   match OverLength /\%80v.\+/
 endif

" ========== syntastic
 let g:syntastic_always_populate_loc_list=1
" :Error
" :lnext :lprev

" ======= GUI
set guioptions-=T "hide toolbar
set guioptions+=e " add tab pages
set guioptions-=r " ghide right-hand scrollbar
set guioptions-=L " ghide left-hand scrollbar

if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc. NOTE
  if v:version > 701
    autocmd Syntax * call matchadd('Todo', '\W\zs\(TRICKS\|TODO\|FIXME\|CHANGED\|???\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

