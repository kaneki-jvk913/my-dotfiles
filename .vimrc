
" █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
"
"       █████╗ ██╗   ██╗ ██████╗ ██╗   ██╗██████╗ 
"      ██╔══██╗╚██╗ ██╔╝██╔═══██╗██║   ██║██╔══██╗
"      ███████║ ╚████╔╝ ██║   ██║██║   ██║██████╔╝
"      ██╔══██║  ╚██╔╝  ██║   ██║██║   ██║██╔══██╗
"      ██║  ██║   ██║   ╚██████╔╝╚██████╔╝██████╔╝ 
"      ╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚═════╝ 
" █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█



                                         
"-------------------------------------------------------------
"---------------------------plugins---------------------------
"-------------------------------------------------------------

"|||||||||||| vim-airline plugin costumization ||||||||||||||||

" Set the airline theme
let g:airline_theme = 'dracula'  " Change 'molokai' to your preferred theme
"molokai   dracula jellybeans


"  Enable vim-airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

"   disable garbage in right of bar
let g:airline#extensions#whitespace#enabled = 0   

"    Customize vim-airline sections 
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create([])
let g:airline_section_c = airline#section#create(['%{expand("%:~:.")}'])
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%l:%c'])


if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.readonly = ''




"###############################################################################
"###############################################################################

"colorscheme dracula
"set termguicolors
"colorscheme material
"colorscheme nord
"colorscheme catppuccin_mocha

set laststatus=2
set statusline=%F\ %m\ %r\ %=Line:\ %l/%L\ Column:\ %c

set number
highlight LineNr ctermfg=green guifg=green 

syntax on

autocmd BufReadPost,BufNewFile * startinsert " always start in insert mode

set fillchars=eob:\    " rmove ~ from empty lines

"set mouse=a         " allow using mouse to move cursor

set whichwrap+=<,>,[,] " allow to pass betwwen line without shift 







"-----------------------------------------------------------------
"#################### keybinds #################################

 "save and exit:  Ctrl+S 
          nnoremap <C-s> :wq<CR>
          inoremap <C-s> <Esc>:wq<CR>
          vnoremap <C-s> <Esc>:wq<CR>
          cnoremap <C-s> <C-c>:wq<CR>

" Enable exiting without saving with Ctrl+X in all modes
          nnoremap <C-q> :q!<CR>
          inoremap <C-q> <Esc>:q!<CR>
          vnoremap <C-q> <Esc>:q!<CR>
          cnoremap <C-q> <C-c>:q!<CR>
 
" Enable saving without exiting with Ctrl+O in all modes
          nnoremap <C-o> :w<CR>
          inoremap <C-o> <Esc>:w<CR>a
          vnoremap <C-o> <Esc>:w<CR>gv
          cnoremap <C-o> <C-c>:w<CR>



" search with control + f
          nnoremap <C-f> /
          inoremap <C-f> <Esc>/
          vnoremap <C-f> <Esc>/
          cnoremap <C-f> <C-c>/
 



" select text with arrows
:inoremap <c-left> <esc>vb
:inoremap <c-right> <esc>ve

:nnoremap  <c-right> <esc>ve
:nnoremap  <c-left> <esc>vb



"For Normal Mode copy and past
nnoremap c y
nnoremap v p

"For Visual Mode copy and past
vnoremap c y
vnoremap v p





"""""""""""""""""""""""""











