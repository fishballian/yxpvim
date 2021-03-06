"common setting
set nocompatible
set expandtab "空格代替tab
set shiftwidth=4
set tabstop=4 "tab长度
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5
set encoding=utf-8
set hlsearch
syntax on
set nu
call pathogen#infect()
call pathogen#helptags()
set wildignore+=*.beam,*.class,cifs*,*.mcm,tags,.git,.svn,ets_meta_config,*.dump,Proto.xml,record_info.erl,testlog,recore_info.erl,_build
set modeline 

"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'compatible'

"vundle
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'yegappan/grep'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-skeletons'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/erlang-motions.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
"Plugin 'mhinz/vim-signify'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'martinda/Jenkinsfile-vim-syntax'
call vundle#end()
filetype plugin indent on

"erlang setting
let g:erlangManPath='/usr/local/lib/erlang/man'
let g:erlang_show_errors=0
let erlang_skel_header = {"author": "yuanxiaopeng", "owner": "ya"}
set runtimepath^=$HOME/.vim/bundle/vim-erlang-runtime
set runtimepath^=$HOME/.vim/bundle/vim-erlang-tags
set runtimepath^=$HOME/.vim/bundle/vim-erlang-compiler
let g:erlang_make_options_rules =
            \ [{'path_re': '/home/yxp/m22',
            \   'options':
            \     ' --outdir /home/yxp/m22/ebin' .
            \     ''}]
let g:erl_author="yuanxiaopeng"
let g:erl_company="xy"
autocmd FileType erlang set tags^=/usr/lib/erlang/lib/tags
autocmd FileType cpp set tags^=/usr/include/tags
autocmd FileType c set tags^=/usr/include/tags

"compile erl
func CompileErl()
    exec "!sh mgectl cl %:t:r"
endfunc

func Rebar3Check()
    exec "!rebar3 release && rebar3 as test eunit && rebar3 as test ct"
endfunc

map <F5> :call GoRun() <CR>

func GoRun()
    exec "GoRun"
endfunc

map <F6> :call CompileAndReload()<CR>

"common test
func CommonTest()
    exec "!export PATH=/opt/erlang19.3/bin:$PATH; ct_run -suite %:t:r -dir test/game -logdir test/testlog -config test/server.config -include include include/proto config/erl -noinput -pa ebin"
endfunc

"common test2
func CommonTest2()
    exec "!rebar3 release && rebar3 ct --suite %:t:r"
endfunc

func CompileAndReload()
    exec "!make all && _build/default/rel/game/bin/game eval \"game_lib:hot_update()\""
endfunc

map <F7> :call CommonTest2()<CR>
"
""compile csharp
"func CompileCs()
"    exec "!mcs -r:/usr/lib/mono/4.5-api/System.Xml.Linq.dll %:t && mono %:t:r.exe"
"endfunc
"map <F8> :call CompileCs()<CR>
"
"compile c
func CompileC()
    exec "!gcc -g -lstdc++ -std=c++98 -lm -D _POJ -D _TEST -o %:t:r.out % && time ./%:t:r.out"
endfunc
map <F8> :call CompileC()<CR>

func ResetServer()
    exec "!make all && rm -fr /data/database/mnesia/jzyw_debug_1/ && sh mgectl restart && rm -fr MnesiaCore*"
endfunc
map <F9> :call ResetServer()<CR>

func Makeproto()
    exec "!make proto proto_check && sh mgectl cl proto_check gateway_proto_router gateway_proto_map"
endfunc
map <F10> :call Makeproto()<CR>

func ResetServer2()
    exec "!make all && rm -fr /data/database/mnesia/jzyyw_debug_1/ && sh mgectl restart && rm -fr MnesiaCore*"
endfunc
map <F11> :call ResetServer2()<CR>



colorscheme molokai
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nnoremap <C-l> :TlistToggle<CR>

autocmd BufNewFile *.cpp 0r ~/.vim/templates/poj_cpp.tlp
autocmd BufNewFile *.c 0r ~/.vim/templates/poj_c.tlp

command! -nargs=+ NewGrep execute 'silent grep! <args>' | copen 10
