"" ======== vim在所有平台下的基础配置
"" 例如idea平台,需要另外创建一个.ideavimrc
"" 在idea中输入 :source ~/.ideavimrc

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set ai 
"自动缩进宽度
set sw=4 
set ts=4 
"关闭高亮显示
set nohlsearch   
set is
set ignorecase
set showmode
"" 屏幕滚动时预留5行
set so=5
set incsearch
set nu

set backspace=indent,eol,start
set clipboard=unnamed
set number

:inoremap jj <esc>

"自己配置的东西

"字体
filetype off
set guifont=Consolas:h20:cGB2312
"显示行数
set nu!
"关闭兼容
set nocompatible
"语法高亮
syntax on
"括号匹配
set showmatch
"set smartindent
"开启代码折叠
set foldenable
"tab按键的空格数
set tabstop=4
"显示光标列数
set ruler
"自动缩进
set autoindent 

"键盘映射
map ti :tabe.<cr>
"设置背景颜色
colorscheme desert