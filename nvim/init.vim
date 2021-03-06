
""""""" set config {{{
syntax enable
syntax on
syntax sync minlines=200

set t_Co=256                " 256色
set title
set nocompatible            " Be iMproved
set gfn=Ricty:h12
set number                  " 行数を表示
set encoding=utf-8
set tabstop=2               " tab はだいたい`soft` の `2`
set expandtab               " softtab 有効
set softtabstop=2
set shiftwidth=2
set autoindent
set noequalalways           " window サイズの自動調整を無効化
set incsearch               " インクリメンタルサーチ有効
set noswapfile              " スワップファイルをつくらない
set nobackup
set noundofile              " undofile は作らない http://www.kaoriya.net/blog/2014/03/30/
set hidden                  " 編集中でも、保存しないで他のファイルを開けるようにする
set confirm                 " ファイルを保存していない場合に、ファイルの保存を確認するダイアログを出す
set cmdheight=2             " 画面下部に表示されるコマンドラインの高さの設定
set showcmd                 " 入力したコマンドをステータスライン上に表示  例えばdを入力したらdと表示される
set scrolloff=5             " カーソルの上または下に表示される最小限の行数  5に設定してあるので、下に5行は必ず表示される
set visualbell              " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set vb t_vb=                " ビープを鳴らさない
set mouse=a                 " 全モードでマウスの操作を有効
set laststatus=2            " ステータスラインを常に表示する
set ruler                   " ルーラを表示
set cursorline              " カーソル行ハイライト
set showmatch               " カッコの対応をハイライト
set wrapscan                " 最後まで検索したら先頭に戻る
set ignorecase              " 大文字小文字を無視する
set smartcase               " 検索文字列に大文字が含まれている場合は区別して検索する
set hlsearch                " 検索語を強調表示
set lazyredraw
set foldmethod=indent
set foldlevel=1
set foldcolumn=0
set colorcolumn=80
set norelativenumber
set showtabline=2
set completeopt-=preview
set modeline
set modelines=4
"" neovim だと以下設定だとおかしくなる
" set shellcmdflag=-ic
set clipboard=unnamed
set ambiwidth=double

""" color scheme
augroup color_scheme
  autocmd!
  """ カラースキーム適用時に実行される
  autocmd ColorScheme * highlight Visual term=reverse cterm=reverse
augroup end

let g:molokai_original=1
colorscheme molokai

" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

"}}}


""""""" plugins {{{
" filetype の判定と typeによる plugin, indent を一旦 off
" ファイル終端で ON にしている
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'LeafCage/foldCC.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'kana/vim-submode'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'rhysd/clever-f.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'tweekmonster/nvim-checkhealth'

" ruby
Plug 'tpope/vim-haml', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

" JS
Plug 'marijnh/tern_for_vim', { 'for': 'javascript' }

" JSX
Plug 'pangloss/vim-javascript', { 'for': 'jsx' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }

" HTML
Plug 'mattn/emmet-vim', { 'for': ['html','eruby'] }

" go
Plug 'kazukgw/ctrlp-goimport', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

" python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" on command
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'rking/ag.vim', { 'on': 'Ag' }
Plug 'thinca/vim-qfreplace', { 'on': 'Qfreplace' }
Plug 'thinca/vim-quickrun', { 'on': 'QuickRun' }
Plug 'vim-scripts/Align', { 'on': 'Align' }

call plug#end()
""" }}}


""""""" deoplete {{{

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
" let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
" let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'
""" }}}


""""""" NERDTree {{{
noremap nt :NERDTreeToggle <CR>
let NERDTreeShowHidden = 1
""" }}}


""""""" Lightline {{{
let g:lightline = {
        \ 'separator': { 'left': '⮀', 'right': '⮂'  },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃'  },
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ }
\ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \  (&ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

""" }}}


""""""" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <Plug>(easymotion-s2)
""" }}}


""""""" IndentLine {{{
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#505050'
let g:indentLine_char = '¦'
""" }}}


""""""" Ctrlp {{{
nnoremap <Space>b :<c-u>CtrlPBuffer<CR>
nnoremap <Space>g :<c-u>CtrlPGoImport<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore-dir ".git" --ignore-dir "_workspace" -g ""'
endif
let g:ctrlp_custom_ignore = '(\.git)|(_workspace)'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
""" }}}


""""""" tern_for_vim {{{
let g:tern#is_show_argument_hints_enabled = 0
""" }}}


""""""" vim-gitgutter {{{
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '✘'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_map_keys = 0
""" }}}


""""""" NERDCommenter {{{
nmap ,, <Plug>(caw:i:toggle)
vmap ,, <Plug>(caw:i:toggle)
""" }}}


""""""" vim-submode {{{
" window のリサイズを自動でできるように
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
""" }}}


""""""" Gitv {{{
let g:Gitv_OpenPreviewOnLaunch = 0
""" }}}


""""""" tagbar {{{
nnoremap <C-]> g<C-]>
noremap tb :TagbarToggle <CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }


" for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" for markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'ctagsbin' : '/Users/kazukgw/Dropbox/kazukgw/bin/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
      \ 's:sections',
      \ 'l:links',
      \ 'i:images'
    \ ],
    \ "sro" : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ "sort" : 0,
  \ }

let g:markdown_fenced_languages = [
\  'css',
\  'java',
\  'cpp',
\  'c',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'go',
\  'objc',
\  'python',
\]
""" }}}


""""""" syntastic {{{
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['javascript', 'ruby', 'python'] }
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_ruby_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/ruby'
let g:syntastic_rubocop_exec = '/Users/kazukgw/.rbenv/versions/2.2.1/bin/rubocop'
let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_pylint_exec = '/Users/kazukgw/.pyenv/versions/2.7.10/bin/pylint'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
""" }}}


""""""" quickrun {{{
let g:quickrun_config = {}
""" }}}


""""""" 全角スペースのハイライト {{{
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
""" }}}


""""""" vim-json {{{
let g:vim_json_syntax_conceal = 0
au BufNewFile,BufReadPost *.json set conceallevel=0
""" }}}


""""""" FoldCC {{{
set foldtext=FoldCCtext()
set fillchars=vert:\|
hi Folded gui=bold term=standout ctermbg=236 ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
hi FoldColumn gui=bold term=standout ctermbg=236 ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
""" }}}


""""""" vim-go {{{
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" let g:gocomplete#system_function = 'vimproc#system2'
let g:go_autodetect_gopath = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
""" }}}


""""""" MySettings {{{
let mapleader = "\<Space>"
command! Vimrc :e ~/.vimrc
command! -nargs=1 -complete=file NSS NeoSnippetSource <args>
command! Cpc CtrlPClearAllCaches
command! Neotags NeoCompleteTagMakeCache

noremap <Space>git :Gitv --all<CR>
noremap <Space>gitf :Gitv! --all<CR>

command! Reload :source ~/.vimrc

" backupskip は backup を作らないファイルを指定するが
" mac で crontab -e でvimを使う場合はこの設定が必要ぽい
set backupskip=/tmp/*,/private/tmp/*

""" カーソル
" 挿入モードでカーソル形状を変更する
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"
" カーソル形状がすぐに元に戻らないのでタイムアウト時間を調整
set ttimeoutlen=10
" 挿入モードを抜けた時にカーソルが見えなくなる現象対策(なぜかこれで治る)
inoremap <ESC> <ESC>
" insert mode でemacs風な動き
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

""" tab
nnoremap tt :tabnew<CR>
nnoremap tq :tabclose<CR>
nnoremap tn gt
nnoremap tp gT

""" 連続でインデントを操作
vnoremap < <gv
vnoremap > >gv

""" grep したら QuickFixを自動で開く
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

""" current buffer を vimgrep
command! -nargs=1 S exec 'vimgrep '. string(<q-args>). ' %'

""" current buffer の /// or ### でコメントしている部分を vimgrep
command! M exec 'vimgrep "\(\/\/\/\|###\)" %'

""" gj(k) と j(k) を入れかえ
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk K

""" tab文字等可視化
" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set listchars=tab:\▸\       " tab

" 上記特殊文字の文字色
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

""" 編集中のファイルをrename
command! -nargs=+ -bang -complete=file Rename let pbnr=fnamemodify(bufname('%'), ':p')|exec 'f '.escape(<q-args>, ' ')|w<bang>|call delete(pbnr)

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

""" es6
au BufNewFile,BufRead *.es6 set filetype=javascript

""" go
command! PlayGo :set ft=go | :0r ~/.templates/quickrun_go.go

""" }}}

""""""""""""""""""""""""""""""
filetype plugin indent on


