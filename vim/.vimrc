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

" middle-click paste
map! <S-Insert> <MiddleMouse>

" buffers
map	<C-d>		:BuffergatorToggle<CR>
map	<C-a>		:UndotreeToggle<cr>
map	<F4>		:TagbarToggle<CR>
map	<C-e>		:NERDTreeToggle<CR>:NERDTreeMirror<CR>
map	<C-s>		:w <CR>
map	<leader>e	:NERDTreeFind<CR>
nmap	<leader>nt	:NERDTreeFind<CR>

map	<A><Left>	:tabprev<CR>
map	<A><Right>	:tabnext<CR>

map	<C><Left>	:bn<CR>
map	<C><Right>	:bp<CR>
" Close the current buffer
map	<leader>bd	:Bclose<cr>I
map	<leader>ba	:1,1000 bd!<cr> " Close all the buffers"
map	<C-t>		:tabnew<cr>
map	<Leader>to	:tabonly<cr>
map	<Leader>tc	:tabclose<cr>
map	<Leader>tm	:tabmove<cr>
map	<leader>te	:tabedit <c-r>=expand("%:p:h")<cr> " Opens a new tab with the current buffer's path

 " Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_

noremap <Leader>cd	:lcd %:h<CR>:pwd<CR>

" fugitive shortcuts
noremap <Leader>gs	:Gstatus<CR>
noremap <Leader>gc	:Gcommit<CR>
noremap <Leader>ga	:Gwrite<CR>
noremap <Leader>gl	:Glog<CR>
noremap <Leader>gd	:Gdiff<CR>
noremap <Leader>gb	:Gblame<CR>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Définit le répertoire de sauvegarde
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup

set shell=bash " define the shell
set shellcmdflag=-ic " load .bashrc

set t_Co=256



let g:airline_theme = 'powerlineish'
if !exists('g:airline_powerline_fonts')
" Use the default set of separators with a few customizations
let g:airline_left_sep='›' " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
endif
""""""
"set showmode " Display the current mode
"set cursorline " Highlight current line

highlight clear SignColumn " SignColumn should match background for
highlight clear LineNr " Current line number row will have same background color in relative mode.

" always show status bar
if has('statusline')
        set laststatus=2

" Broken down into easily includeable segments
        set statusline=%<%f\ " Filename
        set statusline+=%w%h%m%r " Options

 "set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y] " Filetype
        set statusline+=\ [%{getcwd()}] " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
    endif

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
    set wildmenu " Show list instead of just completing
    set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
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

" Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e

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

 " NerdTree
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
"let :nerdtree_tabs_open_on_gui_startup=0

" ================================================== Aucocomplete

 " Ctags {
        set tags+=./tags/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif

      set nocp
      filetype plugin on

      set tags+=~/.vim/tags/cpp
      "set tags+=~/.vim/tags/gl
      "set tags+=~/.vim/tags/sdl
      "set tags+=~/.vim/tags/qt4

      " build tags of your own project with Ctrl-F12
      map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
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

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

set tag+=~/.vim/tags/cpp
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
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
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
  let g:neocomplcache_enable_cursor_hold_i = 1
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

          " For perlomni.vim setting.
          " https://github.com/c9s/perlomni.vim
          let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

function UpdateHeaderDate()
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


function SetHeader()
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


function Epi_CHHeader_Insert()
  0r ~/.vim/c_hdr_epi.tpl
  call SetHeader()
  call UpdateHeaderDate()
  normal G
  normal dd
  let save_cursor = getpos(".")
  let save_cursor[1] = save_cursor[1] - 2
  call setpos(".", save_cursor)
endfunction

function Epi_CHeader_Insert()
  0r ~/.vim/c_epi.tpl
  call SetHeader()
  call UpdateHeaderDate()
  normal G
endfunction

au BufNewFile {*.h{,h}} call Epi_CHHeader_Insert()
au BufNewFile {*.{c{,c,++,pp},h{,h,pp}},Makefile} call Epi_CHeader_Insert()
au BufWritePre {*.{c{,c,++,pp},h{,h,pp}},Makefile} call UpdateHeaderDate()

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" change color for the colorcolumn
highlight ColorColumn ctermbg=235 guibg=#2c2d27
" change color for the current column number
hi CursorLineNr   term=bold ctermfg=Red gui=bold guifg=Red
au BufNewFile,BufRead {*.{c,h}} set colorcolumn=80

" met en rouges les chars. depassant la 80e col.
 let ext = expand("%:e")
 if (ext == "h" || ext == "c")
   set comments=sr:/*,mb:**,ex:*/ " it seems it doesn't work when
   set showfulltag     " when completing by tag, show the whole tag
   highlight OverLength ctermfg=red guibg=#592929
   match OverLength /\%80v.\+/
 endif

" syntastic
let g:syntastic_always_populate_loc_list=1
" :lnext :lprev

" ======= GUI
set guioptions-=T "hide toolbar
set guioptions+=e " add tab pages
set guioptions-=r " ghide right-hand scrollbar
set guioptions-=L " ghide left-hand scrollbar

