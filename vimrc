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
set wildignore+=*.beam,cifs*,*.mcm,*.cs,tags,.git,.svn,ets_meta_config,*.dump,proto_check.erl,Proto.xml,all_pb.hrl,gateway_proto_router.erl,record_info.erl,robot_proto_router.erl,testlog,recore_info.erl
set modeline 
filetype plugin indent on 
"powerline
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'compatible'
"vundle
set rtp+=$HOME/.vim/bundle/vundle/  
call vundle#rc()  
Bundle 'kien/ctrlp.vim'
Bundle 'yegappan/grep'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-erlang/vim-erlang-skeletons'
Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'vim-erlang/vim-erlang-tags'
Bundle 'vim-erlang/vim-erlang-compiler'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-erlang/erlang-motions.vim'
Bundle 'VundleVim/Vundle.vim'


"erlang setting
let g:erlangManPath='/usr/local/lib/erlang/man'
let g:erlang_show_errors=0
let erlang_skel_header = {"author": "yuanxiaopeng","owner": "mc"}
set runtimepath^=$HOME/.vim/bundle/vim-erlang-runtime
set runtimepath^=$HOME/.vim/bundle/vim-erlang-tags
let g:erl_author="yuanxiaopeng"
let g:erl_company="mc"
autocmd FileType erlang set tags^=/usr/lib/erlang/lib/tags
"compile erl
func CompileErl()
    exec "!cl %:t:r"
endfunc
map <F5> :call CompileErl()<CR>
"common test
func CommonTest()
    exec "!ct_run -suite %:t:r -dir test/game -logdir test/testlog -config test/server.config -include include include/proto -noinput -pa ebin"
endfunc
map <F6> :call CommonTest()<CR>

