" Options: {{{
set runtimepath+=~.vim
runtime macros/matchit.vim

filetype indent on
syntax enable

set nocompatible  

set undofile
set undodir=${HOME}/.vim/undo
set undolevels=70
set undoreload=100
set viminfo='200,<200,s100,h

set laststatus=2

" set noshowmode
set showcmd
set autoindent
set smartindent

set lazyredraw
set ttyfast

set ttimeout
set ttimeoutlen=10 

set foldmethod=marker
set foldlevel=0

set hlsearch
set incsearch

set hidden
set title
set titleold=

set t_co=256
set relativenumber
set number

set splitbelow
set splitright

set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab

set ffs=unix
set fileencoding=utf-8
set listchars=eol:¬,tab:.. 
" set listchars=eol:¬,tab:▏\ 
set list
" }}}

" Variables: {{{
" UltiSnips: {{{
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" }}}

" Colorschemes: {{{
" Gruvbox: {{{
let g:gruvbox_italic=1
let g:gruvbox_undercurl=0
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_sign_column="bg0"
" }}}

" Solarized: {{{
let g:solarized_termcolors=256
" let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
" }}}
" }}}

" NERDTree: {{{
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenPreviewSplit = 'S'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenPreviewVSplit = 'V'
" }}}

" Signature: {{{
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'PlaceNextMark'      :  "m+",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'PurgeMarksAtLine'   :  "m-",
    \ 'DeleteMark'         :  "dm",
    \ 'PurgeMarks'         :  "m<Space>",
    \ 'PurgeMarkers'       :  "m<BS>",
    \ 'GotoNextLineAlpha'  :  "']",
    \ 'GotoPrevLineAlpha'  :  "'[",
    \ 'GotoNextSpotAlpha'  :  "`]",
    \ 'GotoPrevSpotAlpha'  :  "`[",
    \ 'GotoNextLineByPos'  :  "]'",
    \ 'GotoPrevLineByPos'  :  "['",
    \ 'GotoNextSpotByPos'  :  "m;",
    \ 'GotoPrevSpotByPos'  :  "m,",
    \ 'GotoNextMarker'     :  "]-",
    \ 'GotoPrevMarker'     :  "[-",
    \ 'GotoNextMarkerAny'  :  "]=",
    \ 'GotoPrevMarkerAny'  :  "[=",
    \ 'ListBufferMarks'    :  "m/",
    \ 'ListBufferMarkers'  :  "m?"
\ }
" }}}

" Others: {{{
" Open .tex files as latex
let g:tex_flavor = "latex"

let g:vim_markdown_folding_disabled=1
" let g:asyncrun_exit = "unlet g:asyncrun_open | let g:asyncrun_auto=\"none\""
let g:asyncrun_exit = "let g:asyncrun_open=0"

let g:indentLine_char = '▏'
" preventing the conceallevel option from showing me improtant stuff
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'tex']

let g:c_no_curly_error = 1
" }}}
" }}}

" Plugin manager: {{{
filetype off
call plug#begin('~/.vim/bundle')
"Colorschemes: {{{ 
Plug 'jacoborus/tender.vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'sainnhe/vim-color-forest-night'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/vim-color-desert-night'
" Plug 'sonph/onehalf'
" }}}

" Syntax highlighting: {{{
Plug 'sheerun/vim-polyglot'
Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'mh21/errormarker.vim'
" }}}

" Text objects: {{{
Plug 'b4winckler/vim-angry'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'kana/vim-textobj-user'
" Plug 'rbonvall/vim-textobj-latex'
" }}}

" Dependencies: {{{
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" }}}

" Autocompletion: {{{
" Plug 'Rip-Rip/clang_complete'
" Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'dense-analysis/ale'
" }}}

" Others: {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary' 
Plug 'skywind3000/asyncrun.vim'
Plug 'Houl/repmo-vim'
Plug 'SirVer/ultisnips'
" Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'yssl/QFEnter'
Plug 'kshenoy/vim-signature'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'haya14busa/incsearch.vim'
" }}}
call plug#end()
filetype plugin on
" }}}

" Programming languages config: {{{
" C: {{{
function! CConfig()
    set formatprg=astyle\ -T4pb
    nnoremap <silent> <leader>b :call Build()<cr>
    nnoremap <silent> <leader><cr> :call Run()<cr>
    nnoremap <silent> <leader>d :call AddFuncDef()<cr>

    nnoremap <silent> <leader>gd /\<\w\+\>\s\+\zs\<<C-r><C-w>\>\ze\s*(<cr>
    nnoremap <silent> <leader>gD :vimgrep /\<\w\+\>\s\+\zs\<<C-r><C-w>\>\ze\s*(/g **/*<cr>
endfunction

function! OnNewCFile()
    exec "normal! i"."#include <stdio.h>\n\n\n\nint main()\n{\nreturn 0;\n}"
    normal 5j$
endfunction


" Automatically generate all function definitions in a C file in a single
" regular expresion, doesn't always work
function! AddFuncDef()
    let a:line_num = line('.')
    %g/\_^\<\w\+\>\*\?\s\*\?\<\(main\>\)\@!\<\w\+\>(.*)\(;\)\@!.*$/exec "normal! yy".(a:line_num)."ggpf)C);\<esc>"
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

" Try to figure out what the executable is based on the Makefile and run it
let g:built_binary="a.out"
function! Run()
    let l:current_dir = getcwd()
    let l:file = l:current_dir."/Makefile"
    if filereadable(l:file)
        echo "Searching for executable"
        let l:prog = system("sed -n 's/\\(\\(TARGET\\)\\|\\(NAME\\)\\|\\(PROG\\)\\)\\s\\?:\\?=\\s\\?\\(.*\\)/\\5/p' ".(l:file)) 
        echo l:prog
        let g:asyncrun_open = 10
        exec "AsyncRun ".l:current_dir."/".(l:prog)
    else
        echo "Not even bothering to search"
        let g:asyncrun_open = 10
        exec "AsyncRun ".l:current_dir."/".(g:built_binary)
    endif
endfunction

" }}}
" HTML: {{{ 
" autocmd BufWritePost *.html,*.htm,*.php,*.css AsyncRun xdotool search --onlyvisible --classname Navigator key ctrl+r 
function! LoadHTMLConfig()
    setlocal shiftwidth=3
    setlocal softtabstop=3 tabstop=3 expandtab

    call MapTagsShortcuts()
endfunction

function! MakeHTML()
    set noautoindent
    set nosmartindent
    let l:tag = " <!DOCTYPE html>\n <html>\n \t<head>\n \t\t<meta charset=\"utf-8\" name='viewport' content=\"width=device-width, intial-scale=1.0\">\n \t\t<title></title>\n \t\t<link rel=\"stylesheet\" type='text/css' href=\"index.css\">\n \t</head>\n \t<body>\n \n \t\t<script type=\"text/javascript\" src=\"index.js\"></script>\n \t</body>\n </html>"

    let l:prev_reg = getreg("")
    call setreg("", l:tag)
    normal P/<body>j
    call setreg("", l:prev_reg)
    set autoindent
    set smartindent
endfunction


function! BReload()
    AsyncRun xdotool search --classname --limit 1 Navigator key ctrl+r
endfunction

function! MapTagsShortcuts()
    " setl ofu=csscomplete#CompleteCSS
    setl ofu=htmlcomplete#CompleteTags

    inoremap </    </<C-x><C-o>
    inoremap <? <?php<cr>?>
endfunction

function! MapJSShortcuts()
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
" }}}

" Custom functions: {{{
" Show filename istead of full path if the buffer is to small
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

" Switch between my colorschemes
function ChangeColo(colo_name, forward)
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

    if exists('g:colo_config')
        if exists("g:colo_config['".l:colo."']")
            if  exists("g:colo_config['".l:colo."']['nobg']") && g:colo_config[l:colo]['nobg']
                hi Normal ctermbg=NONE
                hi EndOfBuffer ctermbg=NONE
            endif
            if  exists("g:colo_config['".l:colo."']['visual']")
                exec "hi Visual ctermbg=".g:colo_config[l:colo]['visual']
            endif
        endif
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

" Useless stuff but still don't want to delete it
function TranslateMode()
    set clipboard=unnamedplus
    " Translate from any language to english
    " nnoremap <Cr> :exec "r !trans rus:eng -b \"".getline('.')."\""<cr>

    " Save keyboard layout when leaving insert mode
    autocmd InsertLeave * call SaveLayout()
    " Loading previous keyboard layout
    autocmd InsertEnter * call LoadLayout()

    set ttimeout
    set ttimeoutlen=50
endfunction

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

function! RelativeToLine(from)
    exec "normal i".(line('.') - a:from)
endfunction
" }}}

" Autocompletion: {{{
set completeopt=menu

let g:ale_set_signs = 1
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }

" let g:clang_library_path = '/usr/lib/x86_64-linux-gnu/libclang-7.so'
" let g:clang_use_library = 1
" let g:clang_snippets = 1
" let g:clang_snippets_engine = 'clang_complete'
" }}}

" Key mappings: {{{
" Command line commands: {{{
command! -nargs=* A AsyncRun <args>
command! -nargs=* R let g:asyncrun_open=10 | AsyncRun <args>
command! -nargs=+ Calc call Calculate('<args>')
command! QO let g:asyncrun_open=10
" }}}

" Insert mode: {{{
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

inoremap <A-t> <esc>gt
inoremap <C-b> <C-o>dw
" inoremap <C-c> <C-o>diw
inoremap <C-l> <C-dl
imap <c-c> <C-x><C-o>

inoremap {<cr> {<cr>}<up><end><cr>
" }}}

" Terminal mode: {{{
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-t> <C-\><C-n>gt

tnoremap <Nul> <C-W>N
tnoremap <A-e> <C-\><C-n>
tnoremap <expr> <C-r> '<C-\><C-n>"'.nr2char(getchar()).'pi'
tnoremap <C-^> <C-\><C-n><C-^>
" }}}

" Yanking and pasting: {{{
nmap Y y$

noremap gy "+y
noremap gY "+y$

noremap gp "+p
noremap gP "+P
" }}}

" Window resizing: {{{
noremap <silent> - :exe "resize -2"<cr>
noremap <silent> + :exe "resize +2"<cr>

noremap <silent> g- :exe "vertical resize -2"<cr>
noremap <silent> g= :exe "vertical resize +2"<cr>
" }}}

" Moving between splits: {{{
noremap  <A-j> <C-w>j
noremap  <A-k> <C-w>k
noremap  <A-h> <C-w>h
noremap  <A-l> <C-w>l
noremap  <A-t> <esc>gt
" }}}

" Buffers: {{{
nnoremap <space>bn :bn<cr>
nnoremap <space>bp :bp<cr>

nnoremap <expr> <space>B ":buffer ".input("buffer: ")."\<cr>"
noremap gb :CtrlPBuffer<cr>

" change from buffers with 0-9
let c=0
while c <= 9
    exec "nnoremap <space>b".c." :buffer ".c."\<cr>"
    let c+=1
endw
" }}}

" Splits & Tabs: {{{
noremap <silent> <space>sn :16new<cr>
noremap <silent> <space>vn :vertical new<cr>
noremap <silent> <space>tn :tabnew<cr>

noremap <silent> <space>ss :16sp<cr>
noremap <silent> <space>vs :vsp<cr>
noremap <silent> <space>ts :tab split<cr>

noremap <silent> <space>st :botright sp term://bash<cr>
noremap <silent> <space>vt :vsp term://bash<cr>
noremap <silent> <space>tt :tab sp term://bash<cr>

noremap <space>F :tab sp<cr>
" }}}

" Quickfix: {{{
noremap <expr> <space>cc ":".(len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))?"cclose":"copen")." \| wincmd p"
noremap <space>cn :cn<cr>
noremap <space>cp :cp<cr>

noremap  <A-n> :cn<cr>
noremap  <A-p> :cp<cr>
" }}}

" Plugins: {{{
" Repmo for repeating movement commands: {{{
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

noremap <expr> z; repmo#SelfKey(';', ',')|sunmap z;
noremap <expr> z, repmo#SelfKey(',', ';')|sunmap z,

noremap <expr> ^ repmo#SelfKey('^', '$')|sunmap ^

" repeat the last [count]motion or the last zap-key
map <expr> ; repmo#LastKey(';')|sunmap ;
map <expr> , repmo#LastRevKey(',')|sunmap ,

noremap <expr> '; repmo#SelfKey("]'", "['")|sunmap ';
noremap <expr> ', repmo#SelfKey("['", "]'")|sunmap ',

" add these mappings when repeating with `;' or `,'
noremap <expr> f repmo#ZapKey('f')|sunmap f
noremap <expr> F repmo#ZapKey('F')|sunmap F
noremap <expr> t repmo#ZapKey('t')|sunmap t
noremap <expr> T repmo#ZapKey('T')|sunmap T
" }}}

" ALE: {{{
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> <leader>R <Plug>(ale_find_references)
nmap <silent> <leader>H <Plug>(ale_hover)
" }}}
"
" AsyncRun: {{{
" Asyncronously search for the current word inside directory
nnoremap <leader>f :QO<cr>:AsyncRun -strip grep -r --include "*.%:e" -Hn <cword> .<cr>
nnoremap <leader>af :QO<cr>:AsyncRun -strip grep -r --include "*" -IHn <cword> .<cr>
nnoremap <leader>F :QO<cr>:AsyncRun -strip grep -r --include "*" -IHn  .<left><left>
noremap <space>r :call RunAsync(input('$ '))<cr>
noremap <space>R :call RunLastCommand(0)<cr>

noremap <space>f :NERDTreeToggle<cr>
" }}}

" Easymotion: {{{
" map <silent><Plug>(easymotion-prefix)d <Plug>(easymotion-s2)
map <silent><space><space> <Plug>(easymotion-s2)
" }}}
" }}}

" Others: {{{
noremap g<cr> i<cr><esc>

noremap <silent> zS :setlocal spell spelllang=en_us<cr>
nnoremap <silent> ZW :w<cr>

nnoremap <expr> gA "A".nr2char(getchar())."<Esc>"

nnoremap <leader>gf viWgf
nnoremap <leader>e "=<C-r>"<cr>p

nnoremap <space>w :w<cr>
nnoremap <space>Q :q!<cr>

noremap <silent> <space>l i <ESC>l
noremap <silent> <space>h a <ESC>h

noremap <silent> <space>no :noh<cr>

noremap <silent> <space>L :call RelativeToLine(input('line: '))<cr>
 
noremap <silent> <expr> <space>o "o\<esc>k"
noremap <silent> <expr> <space>O "O\<esc>j"

nnoremap <silent> g<Tab> :call ChangeColo('', 1)<CR>
nnoremap <silent> g<S-Tab> :call ChangeColo('', 0)<CR>

vnoremap . :normal @q<cr> 
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" }}}
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

" Close buffer if the last window is Quickfix from
" http://vim.wikia.com/wiki/Automatically_quit_Vim_if_quickfix_window_is_the_last
au BufEnter *
            \ if &buftype=="quickfix" |
                \ if winbufnr(2) == -1 |
                \   quit! |
                \ endif |
            \ endif |
            \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |
                \ q |
            \ endif

autocmd BufEnter * set omnifunc=ale#completion#OmniFunc

autocmd ColorScheme * call SetStatusline()

" augroup css,scss
"     setl ofu=csscomplete#CompleteCSS
"     set iskeyword=@,48-57,_,-,?,!,192-255
" augroup END

autocmd BufEnter *.config/vimb/config set filetype=vim

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

autocmd BufWritePost *.tex AsyncRun pdflatex %
" autocmd BufWritePost *.js call BReload()
" autocmd BufWritePost *.h,*.c call SyntaxCheck()

autocmd Filetype c,cpp
            \ call CConfig() | 
            \ setl formatexpr=LanguageClient#textDocument_rangeFormatting() |
            \ set textwidth=80 | 
            \ UltiSnipsAddFiletypes cpp.c |
            \ nnoremap <leader>s :call SyntaxCheck()<cr> 

autocmd FileType javascript
            \ call MapJSShortcuts() |
            \ nnoremap <leader>r :AsyncRun nodejs %<Cr> 

autocmd Filetype text,markdown
            \ set textwidth=80 | 
            \ setlocal spell spelllang=en_us

autocmd BufNewFile *.html,*.htm,*.php call MakeHTML()

autocmd Filetype php,html,htm 
            \ UltiSnipsAddFiletypes php.html |
            \ call LoadHTMLConfig()

au BufEnter *\.task/notes*.txt set ft=markdown

autocmd BufNewFile */main.c call OnNewCFile()
" }}}

" Stautsline: {{{
" Note
" Colors from 1 to 17 are from my terminal emulator

" ToDo:
" - Change colors
" - Make this a plugin
let g:modes = {
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
    " I don't use the GVim
    hi   StatusLineNormal     ctermbg=242   ctermfg=233    guibg=NONE   guifg=NONE
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
    hi   User7   ctermbg=236    ctermfg=189  guibg=NONE   guifg=NONE
    hi   User8    ctermbg=179   ctermfg=233    guibg=NONE   guifg=NONE

    set statusline=
    set statusline+=%{ChangeStatusColor()}
    set statusline+=%#StatusLine#
    " show short mode when on small windows
    set statusline+=\ %{winwidth('&')>80?g:modes[mode()]:g:min_modes[mode()]}\ 
    set statusline+=%3*
    " set statusline+=\ %f\ 
    set statusline+=\ (%n)\ %{ShowPath()}\ 
    " set statusline+=%t\ 
    set statusline+=%4*
    " set statusline+=[%{&fileformat}]
    " set statusline+=[%{(&fenc!=''?&fenc:&enc)}]\  "file encoding
    set statusline+=\ %y\ 
    set statusline+=%{ReadOnly()}\ %m%w
    " set statusline+=\ %r
    set statusline+=%5*

    set statusline+=%=

    set statusline+=%6*
    set statusline+=%7*
    set statusline+=\ col\ %c\ \|\  
    set statusline+=line\ %l\ /\ %L\ 
    set statusline+=%8*
    set statusline+=\ \ %P\ \ 
endfunction
" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L: %P
call SetStatusline()
" }}}

" Colorscheme: {{{ 
set bg=dark
" My favorite colorschemes
let g:colorschemes = [
     \'gruvbox',
     \'desert',
     \'zenburn',
     \'forest-night',
     \'onedark',
     \'tender'
\]

let g:colo_config = {
            \ 'forest-night': {'nobg': 1},
            \ 'tender': {'nobg': 0, 'visual': 273}
\}
call ChangeColo('tender', 0)
call matchadd('ColorColumn', '\%81v', 100)
" In case the colorscheme doesn't highlight it
highlight ColorColumn ctermbg=magenta
" }}}
