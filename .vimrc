" Options: {{{
set runtimepath+=~.vim
runtime macros/matchit.vim

set nocompatible  
filetype indent on
syntax enable

" save undo tree
set undofile
set undodir=${HOME}/.vim/undo
set undolevels=70
set undoreload=100

set encoding=utf-8

set viminfo='200,<200,s100,h
" Always show statusline
set laststatus=2
" don't show mode on the command line
set noshowmode

set showcmd

set autoindent
set smartindent

set ttyfast
set lazyredraw

set ttimeout
set ttimeoutlen=10 

" set autoindent
set foldmethod=marker
set foldlevel=0
set backspace=indent,eol,start
set hlsearch
set incsearch
" hidde buffers
set hidden

set title
set titleold=
" set vim to interpret current file directory as the working directory
" set autochdir
set t_co=256
set relativenumber
set number
" open split windows on the bottom of the screen or right by default
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab

set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¬,tab:.. 
" set listchars=eol:¬,tab:▏\ 
set list

" set clipboard=unnamedplus

" set termwinsize="10x0"
" }}}

" Variables: {{{
" Open .tex files as latex
let g:tex_flavor = "latex"

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4

let g:netrw_winsize = 35
let g:vim_markdown_folding_disabled=1

" let g:asyncrun_open = 10

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:ycm_confirm_extra_conf = 0

let g:gruvbox_italic=1
let g:gruvbox_undercurl=0
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_sign_column="bg0"

let g:solarized_termcolors=256
" let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="high"

" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group `Statement`
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

let g:asyncrun_bell = 1
let g:asycrun_exit = "unlet g:asyncrun_open | let g:asyncrun_auto=\"none\""

let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenPreviewSplit = 'S'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenPreviewVSplit = 'V'

let g:indentLine_char = '▏'

" let c_no_curly_error = 1
" }}}

" Plugin manager: {{{
filetype off

call plug#begin('~/.vim/bundle')
" Sorted by how much I used them
"Colorschemes: {{{ 
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'sainnhe/vim-color-forest-night'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/vim-color-desert-night'
" Plug 'sonph/onehalf'
" }}}

" Syntax: {{{
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'mh21/errormarker.vim'
Plug 'baskerville/vim-sxhkdrc'
" Plug 'bfrg/vim-cpp-modern'
" }}}

" Text objects: {{{
Plug 'b4winckler/vim-angry'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'kana/vim-textobj-user'
" Plug 'rbonvall/vim-textobj-latex'
" }}}

" Dependencies: {{{
" Plugins needed for other plugins to run.
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" }}}

" Autocompletion: {{{
Plug 'maralla/completor.vim'
" }}}

" Others: {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary' 
" Plug 'Rip-Rip/clang_complete'
Plug 'skywind3000/asyncrun.vim'
Plug 'Houl/repmo-vim'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'yssl/QFEnter'
Plug 'kshenoy/vim-signature'
Plug 'scrooloose/nerdtree'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
" }}}
"
call plug#end()
filetype plugin indent on
" }}}

" Programming languages config: {{{
" C: {{{
function! CConfig()
    set formatprg=astyle\ -T4pb
    nnoremap <silent> <leader>b :call Build()<cr>
    nnoremap <leader>r :call Run()<cr>
    nnoremap <silent> <leader>d :call AddFuncDef()<cr>

    nnoremap <silent> <leader>gd /\<\w\+\>\s\+\zs\<<C-r><C-w>\>\ze\s*(<cr>
    nnoremap <silent> <leader>gD :vimgrep /\<\w\+\>\s\+\zs\<<C-r><C-w>\>\ze\s*(/g **/*<cr>
endfunction

function! OnNewCFile()
    call AddText("#include <stdio.h>\n\n\n\nint main() {\n    \n\treturn 0;\n}")
    normal 5j$
endfunction


" Automatically generate all function definitions in a C file in a single
" regular expresion
function! AddFuncDef()
    let a:line_num = line('.')
    %g/\_^\<\w\+\>\*\?\s\*\?\<\(main\>\)\@!\<\w\+\>(.*)\(;\)\@!.*$/exec "normal! yy".(a:line_num)."ggpf)C);\<esc>"
endfunction

function! SyntaxCheck()
    let g:asyncrun_open = 6
    let g:asyncrun_auto = "make"
    AsyncRun clang-tidy % -checks '*' -- $(cat .clang_complete)
endfunction


let g:build_command="gcc %:p"
function! Build()
    let g:asyncrun_open = 8
    let l:makefile_path = getcwd()."/Makefile"
    if filereadable( l:makefile_path )
        AsyncRun -auto=make make clean && make
    else
        exec "AsyncRun -auto=make ".g:build_command
    endif
endfunction

" Try figuring out what the executable is based on the Makefile and run it in
" a terminal in a new tab
let g:built_binary="a.out"
function! Run()
    let l:current_dir = getcwd()
    let l:file = l:current_dir."/Makefile"
    if filereadable(l:file)
        let l:prog = system("sed -n 's/\%(TARGET\)\|\%(NAME\)\%(PROG\)\\s\\?:\\?=\\s\\?\\(.*\\)/\\1/p' ".(l:file)) 
        NAME
        let g:asyncrun_open = 10
        exec "AsyncRun ".l:current_dir."/".(l:prog)
    else
        exec "AsyncRun ".l:current_dir."/".(g:built_binary)
    endif
endfunction

" }}}
" HTML: {{{ 
autocmd BufNewFile *.html,*.htm,*.php call MakeHTML()
" autocmd BufWritePost *.html,*.htm,*.php,*.css AsyncRun xdotool search --onlyvisible --classname Navigator key ctrl+r 

function! LoadHTMLConfig()
    set shiftwidth=3
    set softtabstop=3 tabstop=3 expandtab

    call MapTagsShortcuts()
endfunction

function! MakeHTML()
    set noautoindent
    set nosmartindent
    let l:tag = "
\<!DOCTYPE html>\r
\<html>\r
\\t<head>\r
\\t\t<meta charset=\"utf-8\" name='viewport' content=\"width=device-width, intial-scale=1.0\">\r
\\t\t<title></title>\r
\\t\t<link rel=\"stylesheet\" type='text/css' href=\"index.css\">\r
\\t</head>\r
\\t<body>\r
\\r
\\t\t<script type=\"text/javascript\" src=\"index.js\"></script>\r
\\t</body>\r
\</html>"
    call AddText(l:tag)
    normal /<body>j
    set autoindent
    set smartindent
endfunction


function! MapTagsShortcuts()
    " setl ofu=csscomplete#CompleteCSS
    setl ofu=htmlcomplete#CompleteTags

    inoremap </    </<C-x><C-o><C-n><C-n>
    inoremap <? <?php<cr>?>
    " autocomplete ending of a tag
endfunction

function! MapJSShortcuts()
    "convert normal function! to variabe function
    nmap <silent> <Plug>FuncToObj :call ChangeFuncType('o')<cr>
    nmap <silent> <Plug>FuncToNorm :call ChangeFuncType('n')<cr>
    nmap <silent> <Plug>FuncToVar :call ChangeFuncType('v')<cr>
    nmap <silent> <leader>cf :call ChangeFuncType(nr2char(getchar()))<cr>
endfunction

" Change JS function type
function! ChangeFuncType(to)
    let l:this_line = getline('.')
    let l:f_type = (match(l:this_line, ':') != -1 ?
                \ "obj": (match(l:this_line, '=') != -1 ? "var" : "norm"))

    if l:f_type == "norm"
        if a:to == 'v'
            s/\(^\s*\)\(function\)\s*\(\<\w\+\>\)\((.*)\)/\1\3 = \2\4
        elseif a:to == 'o'
            s/\(^\s*\)\(function\)\s*\(\<\w\+\>\)\((.*)\)/\1\3: \2\4
        endif
    elseif l:f_type == "var"
        if a:to == 'n'
            s/\(^\s*\)\(\<[a-zA-z.0-9]\+\)\s*=\s*\(function\)\s*\((.*)\)/\1\3 \2\4
        elseif a:to == 'o'
            s/\(^\s*\)\(\<[a-zA-z.0-9]\+\)\s*=\s*\(function\)\s*\((.*)\)/\1\2: \3\4
        endif
    elseif l:f_type == "obj"
        if a:to == 'n'
            s/\(^\s*\)\(\<\w\+\>\)\s*:\s*\(function\)\s*\((.*)\)/\1\3 \2\4
        elseif a:to == 'v'
            s/\(^\s*\)\(\<\w\+\>\)\s*:\s*\(function\)\s*\((.*)\)/\1\2 = \3\4
        endif
    endif
endfunction
" }}}
" LateX: {{{
function! CompileLatex()
    AsyncRun pdflatex %
endfunction
" }}}
" }}}

" Custom functions: {{{

" Close to useless, I have no idea why I haven't removed it
function! SeparateList()
    s/\([{[(]\)\s*/\1\r
    s/\([,;]\)\s*/\1\r/g
    s/\s*\([}\])]\)/\r\1
endfunction

" Only show filename if the buffer is to small
function ShowPath()
let l:win_width = winwidth('%')

if len(expand('%'))
    if l:win_width > 80
        let l:path = fnamemodify(expand('%'), ":~:.")
    else
        let l:path = expand('%:t')
    endif
else
    let l:path = '[No Name]' 
endif

return l:path
endfunction

" My favorite colorschemes
let g:colorschemes = [
     \'gruvbox',
     \'desert',
     \'zenburn',
     \'forest-night',
     \'onedark',
     \'tender'
\]

" Colorschemes that look better without a background
let g:nobg_colorschemes = [ 'forest-night' ]

" Custom visual selection colors
let g:cvisual_colorscheme = [ 'tender' ]

" Switch between my colorschemes
function ChangeColo(colo_name='', forward=1)
    if len(a:colo_name)
        let l:colo = a:colo_name
    else
        if !exists('g:colors_name')
            let l:colo_index = -1
        else
            let l:colo_index = index(g:colorschemes, g:colors_name)
        endif


        if a:forward && (l:colo_index == -1 || l:colo_index == len(g:colorschemes) - 1)
            let l:colo = g:colorschemes[ 0 ]
        elseif !a:forward && (l:colo_index == -1 || l:colo_index == 0)
            let l:colo = g:colorschemes[ len(g:colorschemes) -1 ]
        else
            let l:colo = g:colorschemes[ l:colo_index + (a:forward ? 1 : -1) ] 
        endif
    endif

    hi clear
    execute "colorscheme ".l:colo

    if index(g:nobg_colorschemes, l:colo) != -1
        hi Normal ctermbg=NONE
        hi EndOfBuffer ctermbg=NONE
    endif

    if index(g:cvisual_colorscheme, l:colo) != -1
        hi Visual ctermbg=237
    endif
endfunction


" ToDo:
" - Improve this function
let g:last_command = ''

function! RunAsync(command)
    if len(a:command) > 0
        if a:command == '!!'
            call RunLastCommand(0)
        else
            let g:asyncrun_open = 8
            let g:last_command = a:command
            exec "AsyncRun ".(a:command)
        endif
    endif
endfunction

function! RunLastCommand(n)
    if exists("g:last_command")
        let g:asyncrun_open = 8
        exec "AsyncRun ".(g:last_command)
    endif
endfunction

" I tried to turn vim into a traslating shell
" I realized it was useless since tras already comes with a -shell option
function TranslateMode()
    set clipboard=unnamedplus
    " Translate from any language to english
    " nnoremap <Cr> :exec "r !trans rus:eng -b \"".getline('.')."\""<cr>

    " Save keyboard layout when leaving insert mode
    autocmd InsertLeave * call SaveLayout()
    " And load it again
    autocmd InsertEnter * call LoadLayout()

    set ttimeout
    set ttimeoutlen=50
endfunction


" Switch layout with english and other languages when entering and living
" insert mode
function SaveLayout()
    let g:prev_layout = substitute(system("setxkbmap -query"), '.*layout:\s\+\(\<\w\+\>\).*', "\\1", "g")
    let g:prev_variant = substitute(system("setxkbmap -query"), '.*variant:\s\+\(\<\w\+\>\).*', "\\1", "g")
    AsyncRun setxkbmap us
endfunction

function LoadLayout()
    if exists('g:prev_layout') != 0
        exec 'AsyncRun setxkbmap '.g:prev_layout.' '.g:prev_variant
    else
        echo "No previous Layout saved"
    endif
endfunction



" Note:
" s(x) = sin(x)
" c(x) = cos(x)
function! Calculate(expr)
    let l:result = system("echo '".(a:expr)."' | bc -l")
    " remove the end of line character
    let l:result = l:result[0:strlen(l:result)-2]
exec "normal! a".(l:result)
endfunction

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! AddText(text)
    exec "normal! i".a:text
endfunction

function! RelativeToLine(from)
    call AddText( line('.') - a:from )
endfunction

" }}}

" Autocompletion: {{{
set completeopt=noinsert,menuone,noselect

let g:clang_library_path = '/usr/lib/x86_64-linux-gnu/libclang-7.so'
let g:completor_min_chars = 3
let g:completor_clang_binary = '/usr/bin/clang-7'
let g:completor_python_binary = '/usr/bin/python3.7'
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'

" }}}

" Key mappings: {{{
" ToDo:
" - order all this somehow 
command! -nargs=* R AsyncRun <args>
command! -nargs=+ Calc call Calculate('<args>')


" Repmo stuff
" noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
" noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" noremap <expr> j repmo#SelfKey('j', 'k')|sunmap j
" noremap <expr> k repmo#SelfKey('k', 'j')|sunmap k

noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
noremap <expr> b repmo#SelfKey('b', 'w')|sunmap b

noremap <expr> ) repmo#SelfKey(')', '(')|sunmap )
noremap <expr> ( repmo#SelfKey('(', ')')|sunmap (

noremap <expr> ]s repmo#SelfKey(']s', '[s')|sunmap ]s
noremap <expr> [s repmo#SelfKey('[s', ']s')|sunmap [s

map <expr> z; repmo#SelfKey(';', ',')|sunmap z;
map <expr> z, repmo#SelfKey(',', ';')|sunmap z,

" repeat the last [count]motion or the last zap-key
map <expr> ; repmo#LastKey(';')|sunmap ;
map <expr> , repmo#LastRevKey(',')|sunmap ,

map <expr> m; repmo#SelfKey("]'", "['")|sunmap m;
map <expr> m, repmo#SelfKey("['", "]'")|sunmap m,

nmap m<cr> m.

" add these mappings when repeating with `;' or `,'
noremap <expr> f repmo#ZapKey('f')|sunmap f
noremap <expr> F repmo#ZapKey('F')|sunmap F
noremap <expr> t repmo#ZapKey('t')|sunmap t
noremap <expr> T repmo#ZapKey('T')|sunmap T


nnoremap <silent> zS :setlocal spell spelllang=en_us<cr>

nnoremap <expr> gA "A".nr2char(getchar())

nmap Y y$

nnoremap <silent> - :exe "resize -2"<cr>
nnoremap <silent> + :exe "resize +2"<cr>

nnoremap <silent> g- :exe "vertical resize -2"<cr>
nnoremap <silent> g= :exe "vertical resize +2"<cr>


nnoremap <silent> ZW :w<cr>

nnoremap <leader>r :QO<cr>:AsyncRun %:p<CR>

" set ALT-Key mappings
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" inoremap <A-a> <M-A>
nnoremap <A-j> <C-w>j 
nnoremap <A-k> <C-w>k 
nnoremap <A-h> <C-w>h 
nnoremap <A-l> <C-w>l 
nnoremap <A-t> <esc>gt

inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-h> <left>
inoremap <A-l> <right>

inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w
inoremap <A-e> <C-o>e

inoremap <A-t> <esc>gt


tnoremap <A-j> <C-w>j 
tnoremap <A-k> <C-w>k 
tnoremap <A-h> <C-w>h 
tnoremap <A-l> <C-w>l 
tnoremap <A-t> <C-\><C-n>gt

tnoremap <Nul> <C-W>N
tnoremap <C-]> <C-\><C-n>
tnoremap <C-r> <C-W>"
tnoremap <C-^> <C-\><C-n><C-^>

inoremap <C-b> <C-o>dw
" inoremap <C-c> <C-o>diw
inoremap <C-l> <C-o>dl

nnoremap gy "+y
nnoremap gY "+y$

nnoremap gp "+p
nnoremap gP "+P

nnoremap <space>w :w<cr>
nnoremap <space>W :wq<cr>
nnoremap <space>q :q<cr>
nnoremap <space>Q :q!<cr>

nnoremap <space><C-b> :CtrlPBuffer<cr>
nnoremap <silent> <expr> <space>o "o\<esc>k"
nnoremap <silent> <expr> <space>O "O\<esc>j"

nnoremap <silent> g<Tab> :call ChangeColo()<CR>
nnoremap <silent> g<S-Tab> :call ChangeColo('', 0)<CR>

nnoremap <leader>gf viWgf

" Asyncronous search recursively in all files with the same extension
" as the current file matching word under the curosr.
command! QO let g:asyncrun_open=10
nnoremap <leader>f :QO<cr>:AsyncRun -strip grep -r --include "*.%:e" -Hn <cword> .<cr>

nnoremap <leader>af :QO<cr>:AsyncRun -strip grep -r --include "*" -IHn <cword> .<cr>
nnoremap <leader>F :QO<cr>:AsyncRun -strip grep -r --include "*" -IHn  .<left><left>

noremap <A-n> :cn<cr>
nnoremap <A-p> :cp<cr>

inoremap {<cr> {<cr>}<up><end><cr>


nnoremap <space>bn :bn<cr>
nnoremap <space>bp :bp<cr>
nnoremap <expr> <space>B ":buffer ".input("buffer: ")."\<cr>"

nnoremap gb :CtrlPBuffer<cr>

" change from buffers with 0-9
let c=0
while c <= 9
    exec "nnoremap <space>b".c." :buffer ".c."\<cr>"
    let c+=1
endw

" nnoremap <space>

nnoremap <space>r :call RunAsync(input('$ '))<cr>
nnoremap <space>R :call RunLastCommand(0)<cr>

nnoremap <space>co :botright copen 8 \| wincmd p<cr>
nnoremap <space>cl :cclose<cr>
noremap <space>cn :cn<cr>
nnoremap <space>cp :cp<cr>
" nnoremap <leader>cc :cclose<cr>
" Evaluate expression in unnamed register
nnoremap <leader>e "=<C-r>"<cr>p

nnoremap g<cr> i<cr><esc>

noremap <silent> <space>l i <ESC>l
noremap <silent> <space>h a <ESC>h

noremap <silent> <space>L :call RelativeToLine(input('line:'))<cr>
" nnoremap <silent> ;p :call PasteFromRegister(nr2char( getchar() ))<cr>

vnoremap . :normal @q<cr> 
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

nnoremap <leader>S :setlocal spell spelllang=en_us<cr>

" nnoremap <space>f :Ve<CR>
nnoremap <space>f :NERDTreeToggle<cr>

" nmap <silent> <Plug>ExpWinH :call ExpandWindow()<cr>
" nmap <silent> <Plug>ExpWinV :call ExpandWindow('v')<cr>

nnoremap <space>sn :16new<cr>
nnoremap <space>vn :vertical new<cr>
noremap <space>tn :tabnew<cr>

nnoremap <space>ss :16sp<cr>
nnoremap <space>vs :vsp<cr>
noremap <space>ts :tab split<cr>

nnoremap <silent><space>st :botright term<cr>
nnoremap <silent><space>vt :vert term<cr>
nnoremap <silent><space>tt :tab term<cr>

nnoremap <silent> <space>no :noh<cr>


nmap <space>F :tab sp<cr>

nmap <c-n> <Plug>CompletorCppJumpToPlaceholder
imap <c-n> <Plug>CompletorCppJumpToPlaceholder

" map <silent><Plug>(easymotion-prefix)d <Plug>(easymotion-s2)
map <silent><space><space> <Plug>(easymotion-s2)
nnoremap <silent> <expr> ## "i {{{\<esc>gcc"
nnoremap <silent> <expr> #$ "i }}}\<esc>gcc"

" }}}

" Autocommands: {{{
" Change cursor depending on the mode
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' | 
                \   silent execute '!echo -ne "\e[6 q"' | redraw |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[4 q"' | redraw |
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw
endif

autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Close buffer if the last window is Quickfix
" Thanks to http://vim.wikia.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
au BufEnter *
            \ if &buftype=="quickfix" |
            \ if winbufnr(2) == -1 |
            \   quit! |
            \ endif |
            \ endif |

au bufenter *
            \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
            \ q |
            \ endif

autocmd ColorScheme * call SetStatusline()

augroup css,scss
    setl ofu=csscomplete#CompleteCSS
    set iskeyword=@,48-57,_,-,?,!,192-255
augroup END

autocmd BufEnter *.config/vimb/config set filetype=vim


autocmd BufRead,BufNewFile *.h,*.c set filetype=c

autocmd BufWritePost *.tex call CompileLatex()
" autocmd BufWritePost *.h,*.c call SyntaxCheck()

autocmd Filetype php UltiSnipsAddFiletypes php.html

autocmd Filetype cpp UltiSnipsAddFiletypes cpp.c

autocmd Filetype c,cpp
            \   set omnifunc=cppcomplete#CompleteCPP | 
            \   call CConfig() | 
            \   nnoremap <leader>s :call SyntaxCheck()<cr>

autocmd FileType javascript nnoremap <leader>r :AsyncRun nodejs %<Cr>

autocmd Filetype text,markdown
            \   set textwidth=80 | 
            \   setlocal spell spelllang=en_us

" autocmd BufEnter * call TranslateMode()

au BufEnter *\.task/notes*.txt set ft=markdown

autocmd BufNewFile main.c call OnNewCFile()

" Vim markers with as comment for each language that I use
nnoremap <silent> <leader>ms o{{{<esc>gcc
nnoremap <silent> <leader>me o}}}<esc>gcc

" {{{ set HTML shortcuts 
" set html shortcuts
autocmd Filetype html call LoadHTMLConfig()
autocmd Filetype php call LoadHTMLConfig()
autocmd Filetype javascript call MapJSShortcuts()
" set javascript shortcuts 
autocmd Filetype html call LoadHTMLConfig()
autocmd Filetype php call LoadHTMLConfig()
autocmd Filetype javascript call MapJSShortcuts()
" }}} 
" }}}

" Stautsline: {{{
" Note that I'm not a designer
" Also colors from 1 to 17 are from my terminal emulator
" So if you want to use my statusline replace does with whatever
" you want

" ToDo:
" - Change colors

let modes = {
            \   'n': 'NORMAL',
            \   'i': 'INSERT',
            \   's': 'SELECT',
            \   'S': 'S-LINE',
            \   '\<C-S>': 'S-B',
            \   'R': 'REPEAT',
            \   'v': 'VISUAL',
            \   'V': 'V-LINE',
            \   '': 'V-B',
            \   't': 'TERMINAL',
            \   'c': 'COMMAND'
            \}

let g:min_modes = {
            \   'n': 'N',
            \   'i': 'I',
            \   's': 'S',
            \   'S': 'S-L',
            \   '\<C-S>': 'S-B',
            \   'R': 'R',
            \   'v': 'V',
            \   'V': 'V-L',
            \   '': 'V-B',
            \   't': 'T',
            \   'c': 'C'
            \}

" let g:prev_mode = 'n'
function! ChangeStatusColor()
let l:mode = mode()

if exists('g:prev_mode') == 0
    let g:prev_mode = 'none'
endif

if g:prev_mode != l:mode
    if l:mode ==# "n"
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineNormal
        redraw
    elseif l:mode ==# "i" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineInsert
        redraw
    elseif l:mode ==# "R"
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineRepeat
        redraw
    elseif l:mode ==# "v" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineVisual
        redraw
    elseif l:mode ==# "V" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineVLine
        redraw
    elseif l:mode == "" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineVBlock
        redraw
    elseif l:mode ==# "s" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineSelect
        redraw
    elseif l:mode ==# "t" 
        let g:prev_mode = l:mode
        hi clear StatusLine
        hi link StatusLine  StatusLineTerminal
        redraw
    endif
endif
return ''
endfunction

function! ReadOnly() abort
if &readonly || !&modifiable
    return ''
else
    return ''
endfunction

function! SetStatusline()
" I don't use the GUI version so I haven't even bothered on writing it's
" color codes
hi   StatusLineNormal     ctermbg=39    ctermfg=235   guibg=NONE   guifg=NONE
hi   StatusLineInsert     ctermbg=130   ctermfg=231    guibg=NONE   guifg=NONE
hi   StatusLineRepeat     ctermbg=131   ctermfg=189   guibg=NONE   guifg=NONE
hi   StatusLineVisual     ctermbg=173   ctermfg=18    guibg=NONE   guifg=NONE
hi   StatusLineVLine      ctermbg=173   ctermfg=18    guibg=NONE   guifg=NONE
hi   StatusLineVBlock     ctermbg=173   ctermfg=18    guibg=NONE   guifg=NONE
hi   StatusLineSelect     ctermbg=45   ctermfg=256    guibg=NONE   guifg=NONE
hi   StatusLineTerminal   ctermbg=16    ctermfg=125   guibg=NONE   guifg=NONE
" colors for each mode 
" hi   User1   ctermbg=35    ctermfg=235                guibg=NONE   guifg=NONE
hi   User2   ctermbg=241    ctermfg=16   guibg=NONE   guifg=NONE
hi   User3    ctermbg=237   ctermfg=189   guibg=NONE   guifg=NONE
hi   User4   ctermbg=234   ctermfg=102   guibg=NONE   guifg=NONE
hi   User5   ctermbg=234    ctermfg=0    guibg=NONE   guifg=NONE
hi   User6   ctermbg=234    ctermfg=15   guibg=NONE   guifg=NONE
hi   User7   ctermbg=236    ctermfg=179  guibg=NONE   guifg=NONE
hi   User8    ctermbg=71     ctermfg=7    guibg=NONE   guifg=NONE

set statusline=
" set statusline+=%1*
set statusline+=%{ChangeStatusColor()}
set statusline+=%#StatusLine#
" mode, show single or triple character mode when on small window
set statusline+=\ %{winwidth('&')>80?g:modes[mode()]:g:min_modes[mode()]}\ 
" set statusline+=%2*
" set statusline+=%{StatuslineGit()}
set statusline+=%3*
" set statusline+=\ %f\ 
set statusline+=\ (%n)\ %{ShowPath()}\ 
" set statusline+=%t\ 
set statusline+=%4*
" set statusline+=[%{&fileformat}]
" set statusline+=[%{(&fenc!=''?&fenc:&enc)}]\  "file encoding
" set statusline+=%<
set statusline+=\ %y\ 
set statusline+=%{ReadOnly()}\ %m%w
" set statusline+=\ %r
set statusline+=%5*

set statusline+=%=

set statusline+=%6*
" set statusline+=\ buf:\ %n\ 
set statusline+=%7*
set statusline+=\ col\ %c\ \|\  
set statusline+=line\ %l\ /\ %L\ 
set statusline+=%8*
set statusline+=\ \ %P\ \ 
endfunction
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L: %P

call SetStatusline()
" }}}
"
" Colorscheme: {{{ 
" set bg=dark 
" colorscheme tender
" hi Visual ctermbg=238

highlight ColorColumn ctermbg=white
set bg=dark
call ChangeColo('tender')
call matchadd('ColorColumn', '\%81v', 100)

" }}}
