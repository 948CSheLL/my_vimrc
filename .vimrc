" files sourced ----------------------------------------------- {{{

" 导入vim自带的vimrc配置文件。
source $VIMRUNTIME/vimrc_example.vim

" 启用 man 插件
source $VIMRUNTIME/ftplugin/man.vim

" }}}

" plugin loaded ----------------------------------------------- {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" youcompleteme
Plugin 'ycm-core/YouCompleteMe'

" my algorithm plugin
Plugin '948CSheLL/gen_common_code'

" 产生YCM 的.ycm_extra_conf.py 文件
Plugin 'rdnetto/YCM-Generator'

" 在缓冲区和标签之间快速移动
Plugin 'tpope/vim-unimpaired'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" plugin config ----------------------------------------------- {{{

" ycm-core/YouCompleteMe

" 配置全局.ycm_extra_conf.py 文件路径
" 通常，YCM 会在.ycm_extra_conf.py文件中搜索编译标志
" 此选项指定配置文件的后备路径，如果找不到，则
" 使用该路径.ycm_extra_conf.py。
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 当此选项设置为1时，YCM 将询问每个.ycm_extra_conf.py文件是否可以安全加载。
let g:ycm_confirm_extra_conf = 0
" This option is a list that may contain several globbing patterns. If a
" pattern starts with a ! all .ycm_extra_conf.py files matching that
" pattern will be blacklisted, that is they won't be loaded and no
" confirmation dialog will be shown. If a pattern does not start with a !
" all files matching that pattern will be whitelisted. Note that this
" option is not used when confirmation is disabled using g:
" ycm_confirm_extra_conf and that items earlier in the list will take
" precedence over the later ones.
"
" Rules:
" * matches everything
" ? matches any single character
" [seq] matches any character in seq
" [!seq] matches any char not in seq
" 这个变量必须在let g:ycm_confirm_extra_conf = 1 时才能用。
" example: let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']


" 强制语法刷新
nnoremap <silent> <Leader>yfc :YcmForceCompileAndDiagnostics<CR>
" 配置查看YouCompleteMe debug information
nnoremap <silent> <Leader>ydi :<C-u>YcmDebugInfo<CR>
" 重启YCM 服务
nnoremap <silent> <Leader>yrs :<C-u>YcmRestartServer<CR>
" 现实YCM 语法诊断的信息
nnoremap <silent> <Leader>ydl :<C-u>YcmDiags<CR>
" log 开关
nnoremap <silent> <Leader>ytl :YcmToggleLogs<CR>
" Looks up the current line for a header and jumps to it.
" Supported in filetypes: c, cpp, objc, objcpp, cuda
nnoremap <leader>gi :<C-u>YcmCompleter GoToInclude<CR>
" Looks up the symbol under the cursor and jumps to its declaration.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, cs, go, java,
" javascript, python, rust, typescript
nnoremap <leader>gdc :<C-u>YcmCompleter GoToDeclaration<CR>
" Looks up the symbol under the cursor and jumps to its definition.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, cs, go, java,
" javascript, python, rust, typescript
nnoremap <leader>gdf :<C-u>YcmCompleter GoToDefinition<CR>
" This command tries to perform the "most sensible" GoTo operation it can.
" Currently, this means that it tries to look up the symbol under the
" cursor and jumps to its definition if possible; if the definition is not
" accessible from the current translation unit, jumps to the symbol's
" declaration. For C-family languages, it first tries to look up the
" current line for a header and jump to it. For C#, implementations are
" also considered and preferred.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, cs, go, java,
" javascript, python, rust, typescript
nnoremap <leader>gt :<C-u>YcmCompleter GoTo<CR>
" This command attempts to find all of the references within the project to
" the identifier under the cursor and populates the quickfix list with
" those locations.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, java, javascript,
" python, typescript, rust
nnoremap <leader>gr :<C-u>YcmCompleter GoToReferences<CR>
" Provides a list of symbols in current document, in the quickfix list. See
" also interactive symbol search.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, go, java, rust
nnoremap <leader>gd :<C-u>YcmCompleter GoToDocumentOutline<CR>
" This command formats the whole buffer or some part of it according to the
" value of the Vim options shiftwidth and expandtab (see :h 'sw' and :h et
" respectively). To format a specific part of your document, you can either
" select it in one of Vim's visual modes (see :h visual-use) and run the
" command or directly enter the range on the command line, e.g. :2,
" 5YcmCompleter Format to format it from line 2 to line 5.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, java, javascript, go,
" typescript, rust, cs
" 这个Format 相当的难用，怎么更改shiftwidth 缩进都是2
" vnoremap <leader>fm :<C-u>'<,'>YcmCompleter Format <CR>
" Where available, attempts to make changes to the buffer to correct
" diagnostics on the current line. Where multiple suggestions are available
" (such as when there are multiple ways to resolve a given warning, or
" where multiple diagnostics are reported for the current line), the
" options are presented and one can be selected.
" Completers which provide diagnostics may also provide trivial
" modifications to the source in order to correct the diagnostic. Examples
" include syntax errors such as missing trailing semi-colons, spurious
" characters, or other errors which the semantic engine can
" deterministically suggest corrections.
" If no fix-it is available for the current line, or there is no diagnostic
" on the current line, this command has no effect on the current buffer. If
" any modifications are made, the number of changes made to the buffer is
" echo'd and the user may use the editor's undo command to revert.
" When a diagnostic is available, and g:ycm_echo_current_diagnostic is set
" to 1, then the text (FixIt) is appended to the echo'd diagnostic when the
" completer is able to add this indication. The text (FixIt available) is
" also appended to the diagnostic text in the output of the :YcmDiags
" command for any diagnostics with available fix-its (where the completer
" can provide this indication).
" NOTE: Causes re-parsing of the current translation unit.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, cs, go, java,
" javascript, rust, typescript
nnoremap <leader>fi :<C-u>YcmCompleter FixIt<CR>
" In supported file types, this command attempts to perform a semantic
" rename of the identifier under the cursor. This includes renaming
" declarations, definitions and usages of the identifier, or any other
" language-appropriate action. The specific behavior is defined by the
" semantic engine in use.
" Similar to FixIt, this command applies automatic modifications to your
" source files. Rename operations may involve changes to multiple files,
" which may or may not be open in Vim buffers at the time. YouCompleteMe
" handles all of this for you. The behavior is described in the following
" section.
" Supported in filetypes: c, cpp, objc, objcpp, cuda, java, javascript,
" python, typescript, rust, cs
" 这个暂时用不了，报错
nnoremap <leader>rn :<C-u>execute 'YcmCompleter RefactorRename '.input('refactor "'.expand('<cword>').'" to:')<CR>
" 回显光标下的变量或方法的类型，以及不同的派生类型。
nnoremap <leader>tp :<C-u>YcmCompleter GetType<CR>


" rdnetto/YCM-Generator
" 配置生成.ycm_extra_conf.py 的命令
" 经过测试这个不好用，可以寻找ycmd 给出的样例进行相应更改
" find /path/to/YCM/ | grep '.ycm_extra_conf.py'
nnoremap <silent> <Leader>yec :<C-u>YcmGenerateConfig<CR>

" }}}

" functions -------------------------------------------------- {{{

function! g:SetKeywordprg(type)
  if a:type ==# 1
    let keyword = expand('<cword>')
    let tmp = split(system('man -k ' . keyword . ' | grep -e "^' . 
          \ keyword . '" | sed -e ''s/(\(.*\))/\1/'' | cut -d'' '' -f2'), "\n")
    if len(tmp) ># 0
      let g:man_page_list = tmp
    else
      return
    endif
    let i = 0
    while i <# len(g:man_page_list)
      let g:man_page_list[i] = 'Man ' . g:man_page_list[i] . ' ' . keyword
      let i = i + 1
    endwhile
    let g:man_page_idx = 0
    execute 'nnoremap >K :<C-u>call g:SetKeywordprg(2)<CR>'
    execute 'nnoremap <K :<C-u>call g:SetKeywordprg(3)<CR>'
  elseif a:type ==# 2
    if g:man_page_idx + 1 >=# len(g:man_page_list)
      let g:man_page_idx = 0
    else
      let g:man_page_idx = g:man_page_idx + 1
    endif
  elseif a:type ==# 3
    if g:man_page_idx - 1 <# 0
      let g:man_page_idx = len(g:man_page_list) - 1
    else
      let g:man_page_idx = g:man_page_idx - 1
    endif
  endif
  execute '' . g:man_page_list[g:man_page_idx]
endfunction

" }}}

" variables ------------------------------------------------- {{{

" 设置先导建
let mapleader = '\'

" 设置本地先导建，通常应用于filetype
" plugin中的map，尽量与mapleader的取值不相同。
" 这个localleader一般是用于类似于这样的映射中 [nnoremap <buffer> Q
" x]，这种映射只有在执行的缓冲区内才能够使用，其他缓冲区不能使用该映射。
let maplocalleader = 'g'


" }}}

" basic settings ------------------------------------------------- {{{ 

" fileencoding选项设置此缓冲区所在文件的字符编码。
" 如果 'fileencoding' 不同于 'encoding'，写文件时需要进行转换。读文件时
" 见下。
" 如果 'fileencoding' 为空，使用 'encoding' 相同的值 (而读写文件也不需要
" 转换)。
" 设置此值时不会报错，只有在使用的时候，写入文件的时候才会。
" fileencodings 选项这是一个字符编码的列表，开始编辑已存在的文件时，参考此选项。如果文件被
" 读入，Vim 尝试使用本列表第一个字符编码。如果检测到错误，使用列表的下一
" 个。如果找到一个能用的编码，设置 'fileencoding' 为该值。如果全都失败，
" 'fileencoding' 设为空字符串，这意味着使用 'encoding' 的值。
set fileencodings=ucs-bom,utf-8,gb18030,latin1

" 下面的选项简单地说是用来格式化往vim 中输入的文本的，该选项和paste 选项
" 相冲突，所以要确保paste 是off 状态。
" 常用的值有c，这个对于c 语言比较舒服，编写注释换行时，可以自动添加注释符
" 还可以搭配textwidth 选项，当一行中输入的字符到达textwidth 的时候，按空白
" 键可以换行。
set formatoptions+=mM

" 根据该选项设置的值，如果一行中插入的字符超过了这一数值，之后如果按了空白
" 符，后面输入的字符都将换行显示，和paste 冲突。
set textwidth=75

" 一般文件不需要使用keywordprg 的默认值，因此将其设置成
" Man 帮助文档的命令
set keywordprg=:Man

" 设置向上向下移动光标时，光标距离屏幕顶部或者底部的行数
set scrolloff=5

" 不启动备份，如果开启，会生成一个后缀是波浪线的文件
set nobackup

" 设置持久撤销选项
if has('persistent_undo')
  " 开启持久撤销，即使是保存了文件，也能撤销
  set undofile
  " 设置撤销文件存储的目录
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif

" 设置支持鼠标选择，按住shift 取消鼠标选择进入visual 模式
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" 设置折叠方式
set foldmethod=marker

" 设置搜索tags 文件的目录
set tags=./tags,../tags,../../tags,tags,/usr/local/etc/systags

" 将使用yank命令复制的内容复制到系统粘贴版。
set clipboard=unnamed,unnamedplus

" 设置左侧显示行号。
set number

" 显示cursor所在行的行号，其他行显示相对于cursor的行号，方便使用 [h, j, k, l]
" 进行cursor移动。
set relativenumber

" 设置statusline的内容，使用help statusline可以查看statusline的item。
set statusline=%f\ -\ FileType:\ %y
set statusline+=%=%l/%L
" 设置状态栏一直在buffer的倒数第二行显示。
set laststatus=2

" 打开文件默认折叠代码。
set foldlevelstart=0 
" 设置折叠层数为1层。
set foldlevel=1 

" 插入模式下让空格代替tab
set expandtab

" set shiftround 设置缩进的宽度, 写vim脚本的话，缩进是两个空格。
" 开启该option，在insert model下按 <c-t> 和 <c-d>为该行的text添加和删除缩进时，
" 缩进量舍入为shiftwidth的倍数。
set shiftround

" }}}

" mappings -------------------------------------------------------- {{{

" 配置git
nnoremap <silent> <localleader>p
      \ :<C-u>w<CR>
      \ :<C-u>terminal<CR>
      \ <C-w>:sleep 200m<CR>cd <C-w>"=fnamemodify(bufname('#'), ':p:h')<CR><CR>
      \ <C-w>:sleep 200m<CR>git add <C-w>"#<CR>
      \ <C-w>:sleep 200m<CR>git commit -m "modify <C-w>"#"<CR>
      \ <C-w>:sleep 200m<CR>git push -u origin main<CR>
      \ <C-w>:sleep 5<CR>2418942810@qq.com<CR>
      \ <C-w>:sleep 5<CR>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<CR>

" 对选择一个单词的命令 viw 进行map。
nnoremap <space> viw

" 设置窗口移动快捷键
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-l> <C-w><C-l>

" 设置在normal model下按 <Leader>ev 键，快速打开.vimrc。
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<CR>
" 设置在normal model下按 <Leader>sv 键，使得新编辑的.vimrc文件生效。
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>

" 在插入模式下按 Esc、ctrl+c、ctrl+[ 键都可以退出insert model。
" 设置 Esc 快捷键，用 jk 键在insert model下map Esc键。
inoremap JK <ESC>
" 设置 Esc 快捷键，用 jk 键在visual model下map Esc键。
vnoremap JK <ESC>
" 设置insert model下，禁止使用 Esc 键。
inoremap <ESC> <NOP>
inoremap <C-c> <NOP>
inoremap <C-[> <NOP>
" 设置visual model下，禁止使用 Esc 键。
vnoremap <ESC> <NOP>
vnoremap <C-c> <NOP>
vnoremap <C-[> <NOP>

" 设置normal model下禁止使用箭头键
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" }}}
 
" abbreviating settings ------------------------------------------------ {{{

" 设置某些字符串字面量的缩写（abbreviation）。
iabbrev @@ 2418942810@qq.com
iabbrev ccopy Copyright 2021 corgitao, all rights reserved.

" }}}

" filetype-specific settings ------------------------------------------- {{{

augroup filetype_vim
  autocmd!
" set shiftwidth=2 在normal model模式下按 >> 键，可以给当前行进行缩进，按 <<
" 键可以给当前行取消缩进。
  autocmd FileType vim 
        \ setlocal shiftwidth=2		|
        \ setlocal tabstop=2 		  |
        \ setlocal softtabstop=2  |
  " 只有文件类型是vim 的时候才开启help 其他的不需要
  autocmd FileType vim 
        \ setlocal keywordprg=:help

augroup END

augroup filetype_c_cpp
  autocmd!
  " tabstop 选项可以用指定数量的空格代替tab
  " softtabstop 选项在插入模式下用一定数量的空格代替tab
  autocmd FileType c,cpp 
        \ setlocal shiftwidth=4   | 
        \ setlocal tabstop=4		  |
        \ setlocal cindent 		    |
        \ setlocal softtabstop=4

  " c，cpp 的keywordprg 选项需要使用man page，而不是vim 的help
  autocmd FileType c,cpp 
        \ nnoremap K :<C-u>call g:SetKeywordprg(1)<CR>
augroup END

" }}}

echo '.vimrc sourced'
