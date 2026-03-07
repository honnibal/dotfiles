""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                  " VIM SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TURNS LINE NUMBERING ON
set nu

" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" ENABLES A SYSTEM-WIDE VIMRC
set nocompatible

" ENSURES DEFVAULT VIM SYNTAX HIGHLIGHTING
syntax on

" ENABLE MOUSE USE IN ALL MODES
set mouse=a

" ENABLE SAVING OF TAB TITLES FOR SESSIONS
set sessionoptions+=tabpages,globals

set encoding=utf-8

set foldmethod=syntax
set foldlevelstart=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                    " PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ENABLES PLUGINS TO WORK
filetype plugin on

" LOCATION OF WHERE PLUGINS ARE INSTALLED
call plug#begin('~/.vim/addons')

" Git wrapper for Vim
Plug 'tpope/vim-fugitive'

" Preview markdown on your modern browser with synchronised scrolling and flexible configuration.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Terminal in floating window
Plug 'voldikss/vim-floaterm'

" Try buffer switcher
Plug 'Yohannfra/Nvim-Switch-Buffer'

" Moving through Vim easily
Plug 'easymotion/vim-easymotion'

" Easy commenting for Vim
Plug 'preservim/nerdcommenter'

" Support for Todo.txt files
Plug 'freitass/todo.txt-vim'

" Gruvbox color theme for Vim
Plug 'morhetz/gruvbox'

" Ranger file browser integration
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Surrounding words with characters in Vim
Plug 'tpope/vim-surround'

" VIM Table Mode for instant table creation.
Plug 'dhruvasagar/vim-table-mode'

" FuzzyFinder (buffer explorer)
Plug 'Daniel451/L9'

Plug 'Glench/Vim-Jinja2-Syntax'

" Tab naming powers
Plug 'gcmt/taboo.vim'

" Multiple cursors for editing
Plug 'mg979/vim-visual-multi'

" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

" Distraction-free writing in Vim
Plug 'junegunn/goyo.vim'

" Vim session saving
Plug 'tpope/vim-obsession'

" Rethinking Vim as a tool for writing
Plug 'reedes/vim-pencil'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "Installs themes for airline

" Python and syntax things
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Terraform syntax
Plug 'hashivim/vim-terraform'

call plug#end()

let g:python3_host_prog = expand('~/.config/nvim/env3.10/bin/python')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                " PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""
"MARKDOWN-PREVIEW
"""""""""""""""""

" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

let g:mkdp_browser = 'vivaldi'

"""""""""""""""""""""
" AIRLINE
"""""""""""""""""""""

" Enabling Powerline symbols
let g:airline_powerline_fonts = 1

" Allows word counting in the following filetypes
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text'

" Shows all buffers when only one tab open
let g:airline#extensions#tabline#enabled = 0

" Handles file path displays
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Sets theme for airline
let g:airline_theme='gruvbox'

""""""""""""""""""""""""""""""
" VIMPENCIL
""""""""""""""""""""""""""""""

" Automatically enable Pencil for files
augroup pencil
  autocmd!
  autocmd FileType py call pencil#init({'wrap' : 'soft'})
  autocmd FileType markdown call pencil#init({'wrap' : 'soft'})
  autocmd FileType tex call pencil#init({'wrap' : 'soft'})
augroup END

""""""""""""""""""""""""""""""
" GRUVBOX
""""""""""""""""""""""""""""""
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark " Setting dark mode

""""""""""""""""""""""""""""""
" VIM-PANDOC
""""""""""""""""""""""""""""""
let g:pandoc#filetypes#handled = ['pandoc', 'markdown']
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#folding#fold_fenced_codeblocks = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#toc#close_after_navigating = 0
let g:pandoc#toc#position = 'bottom'
let g:pandoc#folding#fdc = 0

""""""""""""""""""""""""""""""
" VIM-PANDOC-SYNTAX
""""""""""""""""""""""""""""""
let g:pandoc#syntax#conceal#blacklist = ['strikeout', 'list', 'quotes']

""""""""""""""""""""""""""""""
" RNVIMR
""""""""""""""""""""""""""""""

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(1.0 * &columns)),
            \ 'height': float2nr(round(0.42 * &lines)),
            \ 'col': float2nr(round(0.0 * &columns)),
            \ 'row': float2nr(round(0.54 * &lines)),
            \ 'style': 'minimal'
            \ }

""""""""""""""""""""""""""""""
" VIM-FLOATERM
""""""""""""""""""""""""""""""

let g:floaterm_open_command = 'tabe'

""""""""""""""""""""""""""""""
" VIM-TABLE-MODE
""""""""""""""""""""""""""""""

let g:table_mode_corner = "|"
let g:table_mode_align_char = ":"

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                  " VIM FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                 " KEY REMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps leader to ,
let mapleader = ","

" Feel free to map the shortcut you want
nnoremap <leader>b :SwitchBuffer <cr>

set switchbuf=usetab


" Enables ripgrep for file completion via fzf
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

nnoremap   <silent>   <F9>    :FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=Tmp<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNew --height=0.4 --width=0.98 --wintype=floating --position=bottom --autoclose=2 --title=Tmp<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F10>    :FloatermNext<CR>
tnoremap   <silent>   <F10>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
tnoremap   <silent>   <F11>   <C-\><C-n><CR>

nnoremap   <C-c><C-c> :FloatermSend<CR>
vnoremap   <C-c><C-c> :FloatermSend<CR>

" Buffer navigation for floating terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-space> <C-\><C-n><C-w><C-w>
" Maps easymotion jumps for lines
map <leader><space>l <Plug>(easymotion-bd-jk)
nmap <leader><space>l <Plug>(easymotion-overwin-line)

" Maps easymotion jumps for words
map  <leader><Space>w <Plug>(easymotion-bd-w)
nmap <leader><Space>w <Plug>(easymotion-overwin-w)

" Maps Ranger
nmap <leader><Space>r :RnvimrToggle<CR>

" Maps quit
noremap <leader>q :q<cr>

" Maps quit all
noremap <c-q> :qa<cr>

" Maps write
nnoremap <leader>w :w<cr>

" Maps ripgrep file searching function
nnoremap <C-g> :Rg<Cr>

" Maps display of current buffers
nnoremap <C-b> :Buffers<Cr>

" Deselects currently highlighted searches
nnoremap <Leader><BS> :noh<cr>

" Activates Twiddle case to switch between cases of selected text
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


" Window movement with control hjkl
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-space> <c-w><c-w>

" CoC language server
" Use ctrl+space, to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
