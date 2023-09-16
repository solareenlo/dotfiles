if has('vim_starting')
    set runtimepath+=~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim
endif

packadd vim-jetpack
call jetpack#begin()
call jetpack#add('tani/vim-jetpack', {'opt': 1})
call jetpack#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
call jetpack#add('junegunn/fzf.vim')
call jetpack#add('altercation/vim-colors-solarized')
call jetpack#add('lifepillar/vim-solarized8')
call jetpack#add('osyo-manga/vim-anzu')
call jetpack#add('scrooloose/nerdtree')
call jetpack#add('vim-airline/vim-airline')
call jetpack#add('vim-airline/vim-airline-themes')
call jetpack#add('vim-scripts/vim-auto-save')
call jetpack#add('tpope/vim-surround')
call jetpack#add('tomtom/tcomment_vim')
call jetpack#add('bronson/vim-trailing-whitespace')
call jetpack#add('tpope/vim-fugitive')
call jetpack#add('airblade/vim-gitgutter')
call jetpack#add('prabirshrestha/vim-lsp')
call jetpack#add('mattn/vim-lsp-settings')
call jetpack#add('shun/ddc-source-vim-lsp')
call jetpack#add('Shougo/ddc.vim')
call jetpack#add('vim-denops/denops.vim')
call jetpack#add('Shougo/ddc-ui-native')
call jetpack#add('Shougo/ddc-source-around')
call jetpack#add('Shougo/ddc-matcher_head')
call jetpack#add('Shougo/ddc-sorter_rank')
call jetpack#add('Shougo/echodoc.vim')
call jetpack#add('SirVer/ultisnips')
call jetpack#add('honza/vim-snippets')
call jetpack#add('rust-lang/rust.vim')
call jetpack#add('mattn/vim-goimports')
call jetpack#add('buoto/gotests-vim')
call jetpack#end()

syntax enable
set number
set clipboard+=unnamed,autoselect
setlocal spell spelllang=en_us
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set cursorline
set display=lastline
set autoindent
set showmatch
set matchtime=1
set shortmess-=S
set whichwrap=b,s,h,l,<,>,[,],~
set tabstop=4
set softtabstop=0
set shiftwidth=4
set smarttab
" set expandtab

nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"-------------------------------------------------------------------------------
" Restore the last cursor position.
"-------------------------------------------------------------------------------
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

"-------------------------------------------------------------------------------
" mapleader
"-------------------------------------------------------------------------------
let mapleader = ','

"-------------------------------------------------------------------------------
" auto_save
"-------------------------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

"-------------------------------------------------------------------------------
" fzf
"-------------------------------------------------------------------------------
set rtp+=/goinfre/$USER/.brew/opt/fzf
set rtp+=$HOME/.brew/opt/fzf
nnoremap <Leader>f :FZF<CR>
let $FZF_DEFAULT_OPTS = '--preview "bat --style=numbers --color=always --line-range :500 {}"'

nnoremap <silent> <Leader>r :<C-u>silent call <SID>find_rip_grep()<CR>
function! s:find_rip_grep() abort
    call fzf#vim#grep(
                \   'rg --ignore-file ~/.ignore --column --line-number --no-heading --hidden --smart-case .+',
                \   1,
                \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
                \   0,
                \ )
endfunction

"-------------------------------------------------------------------------------
" Show zenkaku spaces
"-------------------------------------------------------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"-------------------------------------------------------------------------------
" Color
"-------------------------------------------------------------------------------
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized8

"-------------------------------------------------------------------------------
" vim-anzu
"-------------------------------------------------------------------------------
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

"----------------------------------------------------------
" Buffer
"----------------------------------------------------------
"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
"" Close buffer
noremap <leader>c :bd<CR>

nnoremap <silent> <leader>b :Buffers<CR>

"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <Leader>n :NERDTreeToggle<CR>

"----------------------------------------------------------
" vim-airline
"----------------------------------------------------------
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

"-------------------------------------------------------------------------------
" ddc
"-------------------------------------------------------------------------------
call ddc#custom#patch_global('ui', 'native')
inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'minAutoCompleteLength': 1,
      \ }
      \})
call ddc#custom#patch_global('sourceOptions', #{
      \   around: #{ mark: 'A' },
      \ })
call ddc#custom#patch_global('sourceParams', #{
      \   around: #{ maxSize: 500 },
      \ })
call ddc#custom#patch_global('sourceOptions', #{
      \  _: #{
      \    matchers: ['matcher_head'],
      \  }
      \})
call ddc#custom#patch_global('sourceOptions', #{
      \   _: #{
      \     sorters: ['sorter_rank'],
      \   }
      \ })
call ddc#enable()


"-------------------------------------------------------------------------------
" vim-lsp
"-------------------------------------------------------------------------------
call ddc#custom#patch_global('sources', ['vim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'vim-lsp': {
    \   'matchers': ['matcher_head'],
    \   'mark': 'lsp',
    \ },
    \ })


"-------------------------------------------------------------------------------
" echodoc
"-------------------------------------------------------------------------------
" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'echo'
" let g:echodoc#type = 'popup'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
set cmdheight=2


"----------------------------------------------------------
" ultisnips
"----------------------------------------------------------
let g:UltiSnipsUsePythonVersion    = 3
let g:UltiSnipsEditSplit           = 'normal'
let g:UltiSnipsSnippetDirectories  = ['~/.cache/dein/repos/github.com/honza/vim-snippets/UltiSnips']
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEnableSnipMate      = 0
let g:UltiSnipsExpandTrigger       = '<c-k>'
let g:UltiSnipsJumpForwardTrigger  = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
command! SNIP UltiSnipsEdit

"----------------------------------------------------------
" Window
"----------------------------------------------------------
" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>


"----------------------------------------------------------
" session management
"----------------------------------------------------------
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>


"----------------------------------------------------------
" Mappings
"----------------------------------------------------------
" terminal emulation
nnoremap <silent> <leader>t :terminal<CR>

" History
nmap <leader>y :History:<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


"----------------------------------------------------------
" Markdown
"----------------------------------------------------------
augroup update_markdown_syntax
  autocmd!
  autocmd FileType markdown syntax match markdownError '\w\@<=\w\@='
augroup END

"----------------------------------------------------------
" Rust
"----------------------------------------------------------
let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['rustc']
" let g:syntastic_rust_checkers = ['cargo']
