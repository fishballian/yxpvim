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
"let g:erlangHighlightBif=1
let g:erlangManPath='/usr/local/lib/erlang/man'
"set foldenable
set foldlevel=1
let erlang_skel_header = {"author": "yuanxiaopeng","owner": "mc"}
set runtimepath^=$HOME/.vim/bundle/vim-erlang-runtime
set runtimepath^=$HOME/.vim/bundle/vim-erlang-tags
let g:erl_author="yuanxiaopeng"
let g:erl_company="mc"

autocmd FileType erlang set tags^=/usr/lib/erlang/lib/tags
set modeline 

set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'compatible'

set rtp+=$HOME/.vim/bundle/vundle/  
call vundle#rc()  
Bundle 'VundleVim/Vundle.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'yegappan/grep'
Bundle 'vim-erlang/vim-erlang-omnicomplete'
Bundle 'vim-erlang/vim-erlang-skeletons'
Bundle 'vim-erlang/vim-erlang-runtime'
Bundle 'vim-erlang/vim-erlang-tags'
Bundle 'vim-erlang/vim-erlang-compiler'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-erlang/erlang-motions.vim'

filetype plugin indent on 

"BEGIN for vimdiff  
func Wrap()  
  set wrap  
endfunc  
map <F10> :call Wrap()<CR><C-W><C-W> :call Wrap()<CR><C-W><C-W>  
imap <F10> <ESC>:call Wrap()<C-W><C-W> :call Wrap()<C-W><C-W>  
"  "END for vimdiff  


func CompileErl()
    exec "!cl %:t"
endfunc
map <F5> :call CompileErl()<CR>
imap <F5> <ESC>:call CompileErl()<CR>

