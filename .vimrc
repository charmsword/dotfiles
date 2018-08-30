" {{{ PATHOGEN
execute pathogen#infect()
filetype plugin on

"}}} 
" {{{BASICS=========================================
" ==================================================
"set relativenumber
set foldmethod=marker
set foldmarker={{{,}}}
set ruler
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" vim не требует сохранять буфер при переключении:
set hidden
"set path+=**
:cd /Users/mac/Dropbox/Apps/neutriNote
""" директория файла становится рабочей директорией
autocmd BufEnter * silent! lcd %:p:h
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"""inoremap <c-x> <c-x><c-f> – мешает в работе с .vim/keywords.txt
""" несмотря на наличие --client-server XQuartz не будет запускаться вместе с vim:

" when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts). This lets you use w!! to do that after you opened the file already: 
cmap w!! w !sudo tee % >/dev/null

" INVISIBLES
" set list
set listchars=tab:›\ ,eol:¬

"set number
set omnifunc=htmlcomplete#CompleteTags
set backspace=2
set linebreak

set wildmenu
set laststatus=2
"set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

"{{{{---- NEW HIGHLIGHTS KEYWORDS
"syntax match markdownQuote "\[@[^\]]\+\]"
highlight markdownQuote term=bold cterm=NONE ctermfg=White ctermbg=Black gui=NONE guifg=DarkGrey guibg=NONE
highlight markdownFootnote term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
highlight latexQuote term=bold cterm=NONE ctermfg=White ctermbg=Black gui=NONE guifg=DarkGrey guibg=NONE
highlight Foo term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
highlight mineDef term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE

highlight FoldColumn term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
"}}}}
"{{{{----- AUTOCOMPLETION VOCABULARY
set complete+=k~/.vim/keywords.txt
" Remap code completion
inoremap <S-TAB> <C-x><C-k>
set dictionary+=~/.vim/keywords.txt,~/.vim/references.txt
"}}}}
"{{{{------- TEMPLATES
if has("autocmd")
	augroup templates
		autocmd BufNewFile *.ly 0r ~/.vim/templates/template.ly
	augroup END
endif

if has("autocmd")
	augroup templates
		autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
	augroup END
endif
"}}}}

nnoremap <Space> <nop>
let mapleader = "\<Space>"

" Source the vimrc file after saving it
if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
nmap <leader>v :edit $MYVIMRC<CR>

" linebreak:
command! -nargs=* Wrap set wrap linebreak nolist

"}}}
"{{{VARIOUS IMPROVEMENTS (MINE)= = = = = = = = = = = = = = = = = = = = = = = =
"==================================================
nnoremap <space><space> :noh<cr>
au FocusLost * :wa

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

"movement between splits:
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

inoremap <silent> <C-Right> <Esc><c-w>l
inoremap <silent> <C-Left> <Esc><c-w>h
inoremap <silent> <C-Up> <Esc><c-w>k
inoremap <silent> <C-Down> <Esc><c-w>j


nnoremap π "0p
vnoremap π "0p

"----- open in...
vmap <Leader>op y:!open <C-r>0 -a Preview & disown<CR><CR>

"----- RESIZING SPLITS
nnoremap <Leader>= :vert res +10<Cr>
nnoremap <Leader>- :vert res -10<Cr>

"}}}
"{{{ COLORSCHEME==================================================
"=================================================================
" set background=light           
" colorscheme simplifysimplify-light
" colorscheme pyte
set laststatus=2
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ }
hi Folded ctermbg=black
	
call togglebg#map("<F5>")
syntax on


let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline
let g:airline_theme='term'

map <C-n> :NERDTreeToggle<CR>
"}}}
" {{{ MARKDOWN==========================================|
" ==================================================|
" ==================================================|
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.txt set filetype=markdown
au BufNewFile,BufRead * if &ft == '' | set ft=markdown | endif
au BufNewFile,BufRead * if &syntax == '' | set syntax=markdown | endif
autocmd BufNewFile,BufRead /tmp/mutt* set noautoindent filetype=markdown set syntax=markdown 
autocmd BufNewFile,BufRead ~/tmp/mutt* set noautoindent filetype=markdown syntax=markdown 
autocmd BufNewFile,BufRead /private/var/folders/dc/* set syntax=markdown setlocal fo+=aw
au BufRead,BufNewFile *.md syntax match StrikeoutMatch '\~\~.*\~\~'   
"au BufRead,BufNewFile *.md syntax match muspieces '--.*/'
"au BufRead,BufNewFile *.md syntax match images '<).*/'

"MARKDOWN MAPPINGS
"comments 
inoremap <Leader><! <!---<Space><++><Space>-->
inoremap m;i ![]()<Left>
inoremap <C-b> ****<Esc>hi

" markdown folding
set nocompatible
    if has("autocmd")
      filetype plugin indent on
    endif

let g:markdown_fold_style= 'nested'

"}}}
"{{{ TABLES
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
	let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
	let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
	Tabularize/|/l1
	normal! 0
	call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
 endfunction
"}}}
"{{{ CYRILLIC LANGMAP BINDINGS (OLD)
"set langmap=йцукенгшщзхъфывапролджэячсмитьбю/ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ/;qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP[]ASDFGHJKL:'ZXCVBNM,./

"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"map ё `
"map й q
"map ц w
"map у e
"map к r
"map е t
"map н y
"map г u
"map ш i
"map щ o
"map з p
"map х [
"map ъ ]
"
"map ф a
"map ы s
"map в d
"map а f
"map п g
"map р h
"map о j
"map л k
"map д l
"map ж ;
"map э '
"
"map я z
"map ч x
"map с c
"map м v
"map и b
"map т n
"map ь m
"map б ,
"map ю .
"
"map Ё ~
"map Й Q
"map Ц W
"map У E
"map К R
"map Е T
"map Н Y
"map Г U
"map Ш I
"map Щ O
"map З P
"map Х {
"map Ъ }
"
"map Ф A
"map Ы S
"map В D
"map А F
"map П G
"map Р H
"map О J
"map Л K
"map Д L
"map Ж :
"map Э "
"
"map Я Z
"map Ч X
"map С C
"map М V
"map И B
"map Т N
"map Ь M
"map Б <
"map Ю >
"}}}
" {{{ VARIOUS REMAPPINGS = = = = = = = = = = = 
" = = = = = = = = = = = = = = = = = = = = = = =
" BUBBLING TEXT
nmap <C-k> ddkP
nmap <C-j> ddp
vmap <C-k> xkP'[V']
vmap <C-j> xp'[V']

" SCROLLING
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

"REMAP ESCAPE
nnoremap uo <Esc>
vnoremap uo <Esc>gV
onoremap uo <Esc>
inoremap uo <Esc>`^

nnoremap гщ <Esc>
vnoremap гщ <Esc>gV
onoremap гщ <Esc>
inoremap гщ <Esc>`^

"MAP (.) FOR VISUAL MODE
vnoremap . :norm.<CR>
"{{{{----BUFFER SWITCH MAPPINGS
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>q :bd<CR>

nnoremap <Leader><C-left>1 :vert sb 1<CR>
nnoremap <Leader><C-left>2 :vert sb 2<CR>
nnoremap <Leader><C-left>3 :vert sb 3<CR>
nnoremap <Leader><C-left>4 :vert sb 4<CR>
nnoremap <Leader><C-left>5 :vert sb 5<CR>
nnoremap <Leader><C-left>6 :vert sb 6<CR>
nnoremap <Leader><C-left>7 :vert sb 7<CR>
nnoremap <Leader><C-left>8 :vert sb 8<CR>
nnoremap <Leader><C-left>9 :vert sb 9<CR>
nnoremap <Leader><C-left>0 :vert sb 10<CR>

nnoremap <Leader><C-right>1 :vert belowright sb 1<CR>
nnoremap <Leader><C-right>2 :vert belowright sb 2<CR>
nnoremap <Leader><C-right>3 :vert belowright sb 3<CR>
nnoremap <Leader><C-right>4 :vert belowright sb 4<CR>
nnoremap <Leader><C-right>5 :vert belowright sb 5<CR>
nnoremap <Leader><C-right>6 :vert belowright sb 6<CR>
nnoremap <Leader><C-right>7 :vert belowright sb 7<CR>
nnoremap <Leader><C-right>8 :vert belowright sb 8<CR>
nnoremap <Leader><C-right>9 :vert belowright sb 9<CR>
nnoremap <Leader><C-right>0 :vert belowright sb 10<CR>
"}}}}
"}}}
"{{{================LATEX
"{{{{ TEX MAPPINGS
inoremap <Space><right> <Esc>/<++><Enter>"_c4l
inoremap <Space><left> <Esc>?<++><Enter>"_c4l
inoremap ;ch \chapter{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;sc \section{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;su \subsection{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;ss \subsubsection*{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;BQ \quote{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap ;Q \cite{}<++><Esc>?{}<Enter>a
inoremap ;F \footnote{}<Enter><++><Esc>?{}<Enter>a

inoremap ;B \textbf{}<++><Esc>?{}<Enter>a
inoremap ;I \textit{}<++><Esc>?{}<Enter>a

vnoremap ;F <Esc><Esc>`<i\footnote{<Esc>`>5la}<Space>
vnoremap ;BQ <Esc><Esc>`<i\quote{<Esc>`>4la}<Space>
vnoremap ;B <Esc><Esc>`<i\textbf{<Esc>`>5la}<Space>
vnoremap ;I <Esc><Esc>`<i\textit{<Esc>`>5la}<Space>

"~~~~~~tables
inoremap ;TL \begin{center}<Enter>\begin{tabular}{<Space><bar>c<bar>c<bar><Space>}<Enter>\hline<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline\hline<Enter><++><Space>&<Space><++><Space>\\<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline<Enter>\end{tabular}<Enter>\end{center}<Esc>8kf<bar>Ea
inoremap жЕД \begin{center}<Enter>\begin{tabular}{<Space><bar>c<bar>c<bar><Space>}<Enter>\hline<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline\hline<Enter><++><Space>&<Space><++><Space>\\<Enter><++><Space>&<Space><++><Space>\\<Enter>\hline<Enter>\end{tabular}<Enter>\end{center}<Esc>8kf<bar>Ea
"new row
inoremap ;TR <Esc>o<Space><bar><Space>&<Space><++><Space>\\<Esc>F<bar>vc
inoremap жЕК <Esc>o<Space><bar><Space>&<Space><++><Space>\\<Esc>F<bar>vc

"~~~~~~lists
inoremap ;il <Esc>o\begin{itemize}<Enter>\item<Enter>\end{itemize}<Esc>kA<Space>
inoremap ;it <Esc>o\item<Space>

inoremap жшд <Esc>o\begin{itemize}<Enter>\item<Space>
inoremap жше <Esc>o\item<Space>

"--------TEX_RUS_MAPPINGS:
inoremap жср \chapter{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жыс \section{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жыг \subsection{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жыы \subsubsection*{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жИЙ \quote{}<Enter><Enter><++><Esc>?{}<Enter>a
inoremap жЙ \cite{}<++><Esc>?{}<Enter>a
inoremap жА \footnote{}<Enter><++><Esc>?{}<Enter>a

inoremap жИ \textbf{}<++><Esc>?{}<Enter>a
inoremap жШ \textit{}<++><Esc>?{}<Enter>a

vnoremap жА <Esc><Esc>`<i\footnote{<Esc>`>5la}<Space>
vnoremap жИЙ <Esc><Esc>`<i\quote{<Esc>`>4la}<Space>
vnoremap жИ <Esc><Esc>`<i\textbf{<Esc>`>5la}<Space>
vnoremap жШ <Esc><Esc>`<i\textit{<Esc>`>5la}<Space>
"}}}}

"~~~PREVIEW
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Skim'
let g:vimtex_view_method = 'skim'
map <Leader>ll :w<CR>:silent VimtexView<CR>

"~~~COMPILATION
nnoremap <Leader>pt :! pandoc -f markdown -t latex --biblatex --wrap=preserve --top-level-division=chapter -o %:p:r.tex %
" КОНВЕРТАЦИЯ НЕСКОЛЬКИХ ФАЙЛОВ ИЗ .md в latex
" for f in *.md ; do pandoc ${f} -f markdown -t latex --biblatex --wrap=preserve --top-level-division=chapter -s -o ${f/.md/}.tex  ; done

"biblatex конвертирует биб.ссылки типа [@...];
"wrap=preserve оставляет soft-linebreaks в файле, чтобы его удобно было редактировать в vim;
"top-level-div... трансформирует H1 в chapter
"}}}
"{{{-----NEW CYRILLIC BINDINGS

set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
set imdisable
highlight ICursor guifg=NONE guibg=Red

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
inoremap ´£ #
inoremap ´• *
inoremap <C-э> '
inoremap <C-]> `
inoremap <C-3> #
inoremap <C-8> *

function! MyKeyMapHighlight()
   if &iminsert == 0 " при английской раскладке статусная строка текущего окна будет серого цвета
      hi StatusLine ctermfg=White guifg=White
   else " а при русской - зеленого.
      hi StatusLine ctermfg=DarkRed guifg=DarkRed
   endif
endfunction
" call MyKeyMapHighlight() " при старте Vim устанавливать цвет статусной строки
autocmd WinEnter * :call MyKeyMapHighlight() " при смене окна обновлять информацию о раскладках
" использовать Ctrl+F для переключения раскладок
cmap <silent> <C-f> <C-^>
imap <silent> <C-f> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
nmap <silent> <C-f> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-f> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv

"}}}
"{{{-----SPELLING CHECK
map <C-i> :setlocal spell spelllang=ru_yo,en_us<CR>
" map <C-d> :set nospell<CR>
set spellsuggest=15
"}}}
"{{{==============LILYPOND
set runtimepath+=/usr/share/lilypond/2.12.3/vim/ 

"======= LILYPOND MAPPINGS
inoremap дС \makeClusters {<Space>}<++><Esc>?{<Enter>a
inoremap lC \makeClusters {<Space>}<++><Esc>?{<Enter>a
inoremap l%= %=========================
inoremap д:= %=========================
inoremap l%- %-------------------------
inoremap д:- %-------------------------
inoremap lPh <<<Space>{<Space><bar><Space>}<Space>\\<Enter>{<Space><++><Space><bar><Space>}<Space>>><Enter><++><Esc>2k0f{a<Space>
inoremap дЗр <<<Space>{<Space><bar><Space>}<Space>\\<Enter>{<Space><++><Space><bar><Space>}<Space>>><Enter><++><Esc>2k0f{a<Space>
inoremap lT \time<Space>/4<Space><++><Esc>Fela
inoremap дЕ \time<Space>/4<Space><++><Esc>Fela

"------ LILYPOND MINE COMMANDS
nnoremap <Leader>lp :lchdir %:p:h<CR>:! lilypond -fpng -dinclude-settings='../SETTINGS.ly' -dresolution=300 -o ./%:r % && convert -trim %:p:r.png %:p:r.png<CR>
nnoremap <Leader>lf :lchdir %:p:h<CR>:! lilypond -dclip-systems -fpng -dresolution=300 -o ./%:r % && convert -trim %:p:r.png %:p:r.png<CR>

"inoremap <Leader>l% %--------------------bar<Space><ESC>:let i=1 <bar> g/bar /s//\='bar'.i/ <bar> let i=i+1 <CR>o
inoremap <Leader>l% %--------------------bar1<Space><ESC>:let @a=1 <bar> %s/bar\d\+/\='bar'.(@a+setreg('a',@a+1))/g<CR>:nohl<CR>o<CR>

"}}}
"{{{ FUNCTIONS = = = = = = = = = = = = = = = = = = = = = = = = = 
"-----Ranger calling
function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u -t ranger'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction

nmap <leader>r :call Ranger()<CR>
"}}}
"{{{ PLUGINS = = = = = = = = = = = = = = = = = = = = = = = = = 
"-------CtrlP
"" Packages
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_custom_ignore = {
 \ 'dir': '\.git$\|\.yardoc\|bower_components|node_modules|public$|log\|tmp$',
 \ 'file': '\.so$\|\.dat$|\.DS_Store$'
 \ } 
" Key Commands
map <C-\> :NERDTreeToggle<CR>

nnoremap <C-t> :read !pbpaste<CR>

"-------- ORG-MODE
nmap <leader>O @<Plug>OrgNewHeadingAboveNormal
nmap <leader>o @<Plug>OrgNewHeadingBelowNormal
nmap <leader>ø @<Plug>OrgNewHeadingBelowAfterChildrenNormal

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

let g:org_todo_keywords = [['NEXT(n)', 'PROJECT', 'PEND', '•••', '|', 'DONE(d)', 'FRZN', 'PRJCT', '...'],
      \ ['skt4(s)', 'comp(p)', 'mix(m)', '|', 'composed(c)']]



"--------- COMFORTABLE SCROLLING IN VIM PLUGIN
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-l> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-h> :call comfortable_motion#flick(-200)<CR>

"--------- VIM EASY-MOTION
"let g:EasyMotion_keys = 'абвгдежзиклмнопрстэя'
map <Leader> <Plug>(easymotion-prefix)
map W <Plug>(easymotion-w)
map B <Plug>(easymotion-b)

"-------- VIM SNEAK and EASY-MOTION COLORS
highlight Search term=bold cterm=NONE ctermfg=DarkBlue ctermbg=Black gui=NONE guifg=DarkGrey guibg=NONE
hi! link Sneak Search

"ремап f и t, чтобы они работали на несколько строк
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

hi EasyMotionTarget term=bold cterm=NONE ctermfg=Black ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
hi EasyMotionTarget2First term=bold cterm=NONE ctermfg=Black ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
hi EasyMotionTarget2Second term=bold cterm=NONE ctermfg=Black ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE


"----- VIM TABLE-MODE plugin
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
"----- VOOM
let g:voom_python_versions = [3]
nnoremap <Leader>vm :Voom<Space>markdown<CR>zi
nnoremap <Leader>vt :Voom<Space>latex<CR>zi
if has('python3') 
	silent! python3 1 
endif

let g:voom_tree_placement = "right"


"----- VIM-LIGHTLINE PLUGIN

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1


"-----STARTIFY PLUGIN
    let g:startify_custom_header = [
            \ '                                 ________  __ __        ',
            \ '            __                  /\_____  \/\ \\ \       ',
            \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
\ ]

cnoreabbrev s Startify

"------- RAINBOW DELIM PLUGIN
"запуск плагина:
nnoremap <Leader>rd :RainbowDelim

"------- ULTISNIPS PLUGIN
let g:UltiSnipsSnippetsDir='/Users/mac/.vim/mysnippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set rtp^=$HOME

"---------- CTAGS TAGBAR PLUGIN

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '$HOME/.vim/bundle/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"--------- CTAGS EASY-TAGS
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_file = '~/Dropbox/Apps/neutriNote/tags'
set tags=./tags,tags;$HOME

"}}}
"{{{LAST CHANGES==================================================
"=================================================================
set iskeyword=@,48-57,_,.,:,192-255
"}}}
