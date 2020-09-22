" Shougo/dein.vimを使用するためのところ
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  " call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Yggdroot/indentLine')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-airline/vim-airline')
  call dein#add('alvan/vim-closetag')
  call dein#add('suan/vim-instant-markdown')
  " call dein#add('w0rp/ale')
  call dein#add('rust-lang/rust.vim')
  call dein#add('vim-scripts/vim-auto-save')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('tomlion/vim-solidity')
  call dein#add('posva/vim-vue')
  call dein#add('nikvdp/ejs-syntax')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('lifepillar/vim-solarized8')
  " call dein#add('ayu-theme/ayu-vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('prettier/vim-prettier', {
    \ 'build': 'npm install',
    \ 'on_ft': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ]})
  call dein#add('osyo-manga/vim-anzu')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('ekalinin/Dockerfile.vim')
  " call dein#add('lervag/vimtex')
  call dein#add('tokorom/vim-review')
  " call dein#add('frazrepo/vim-rainbow')
  " call dein#add('luochen1990/rainbow')
  call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' })
  call dein#add('junegunn/fzf.vim')
  " VIM Table Mode for instant table creation.
  call dein#add('dhruvasagar/vim-table-mode')
  call dein#add('heavenshell/vim-textlint')
  call dein#add('mattn/emmet-vim')
  call dein#add('itchyny/vim-cursorword')
  " call dein#add('itchyny/vim-parenmatch')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('lambdalisue/nerdfont.vim')
  " call dein#add('mg979/vim-visual-multi') " 複数行編集
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
if dein#check_install()
  call dein#install()
endif

" Prettierがシングルコートを使用するように設定
let g:prettier#config#single_quote = 'true'
" Vimがクリップボードを使えるようにする
" mac用
set clipboard+=unnamed,autoselect
set encoding=UTF-8
" ubuntu用
" set clipboard=unnamedplus

"----------------------------------------------------------
" NERDTree
"----------------------------------------------------------
" ファイル名が指定されてVIMが起動した場合はNERDTreeを表示しない
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" NERDTreeを表示するコマンドを設定する
nnoremap <C-n> :NERDTreeToggle<CR>

" カッコをレインボーカラーにする
" let g:rainbow_active = 1
" let g:rainbow_load_separately = [
"     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"     \ ]
" let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
" let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

"----------------------------------------------------------
" fzf
"----------------------------------------------------------
" fzfの設定
set rtp+=~/.fzf

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
" オートセーブを自動で有効化
let g:auto_save = 1
" インサートモードで自動保存するかどうかの設定
let g:auto_save_in_insert_mode = 0
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
" set shiftwidth=2
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 暗い背景色に合わせた配色にする
set background=dark
" カーソルラインをハイライト
set cursorline
" vim の独自拡張機能を使用(viとの互換性無し)
set nocompatible
" 文字コードを指定
set encoding=utf-8
" ファイルエンコードを指定(先頭から順に成功するまで読み込む)
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
" 自動認識させる改行コードを指定
set fileformats=unix,dos
" バックアップを取得
" 逆は [ set nobackup ]
set backup
" バックアップを取得するディレクトリを指定
set backupdir=~/.vimbackup
" 検索履歴を残す世代数
set history=500
" 検索時に大文字小文字を区別しない
set ignorecase
" 検索語に大文字を混ぜると検索時に大文字を区別する
set smartcase
" 検索語にマッチした単語をハイライト
" 逆は [ set nohlsearch ]
set hlsearch
" インクリメンタルサーチを使用 (検索語の入力最中から随時マッチする文字列の検索を開始)
" 逆は [ set noincsearch ]
set incsearch
" 行番号を表示
" 逆は [ set nonumber ]
set number
" 改行 ( $ ) やタブ ( ^I ) を可視化
" set list
" 括弧入力時に対応する括弧を強調
set showmatch
" 自動インデントを有効にする
" 逆は [ noautoindent ]
set autoindent
" 構文ごとに色分け表示
" 逆は [ syntax off ]
syntax on
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,],~
" [ syntax on ] の場合のコメント文の色を変更
highlight Comment ctermfg=LightCyan
" ウィンドウ幅で行を折り返す
" 逆は [ set nowrap ]
set wrap
" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
" タブ入力を複数の空白入力に置き換える
" set expandtab
" 自動的に閉じ括弧を入力
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
" 現在のモードを表示
set showmode
" カラースキームの設定
" colorscheme desert
" colorscheme molokai
" colorscheme gruvbox
" colorscheme solarized
colorscheme solarized8
set background=dark
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable
" set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
"  let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" 行番号の色
highlight LineNr ctermfg=darkyellow
" htmlの閉じタグ補完
" augroup MyXML
"   autocmd!
"   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
" augroup END
" syntasticの構文エラーチェック
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint','pyflakes', 'pep8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_cpp_compiler="gcc"
" let g:syntastic_cpp_compiler_options=" -std=c++11"
" let g:syntastic_cpp_compiler_options=" -std=c++14"
let g:syntastic_cpp_compiler_options=" -std=c++17"
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
" textlint の configfile の追加
" textlint.vim {{{
" let g:textlint_configs = [
  " \ '@azu/textlint-config-readme',
  " \ '@example/textlint-config-example',
  " \ ]
" }}}

"-------------------------------------------------------------------------
" 全角スペースの表示
"-------------------------------------------------------------------------
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
" 挿入モード時、ステータスラインの色を変更
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"----------------------------------------------------------
" vim-table-mode
"----------------------------------------------------------
" `:TableModeTaggle` を `||` と `__` で有効化・無効化する
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:table_mode_corner = '|'

" mapleaderの設定
:let mapleader = ','

" 検索位置が何番目かを表示
set shortmess-=S

"----------------------------------------------------------
" vim-anzu
"----------------------------------------------------------
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
