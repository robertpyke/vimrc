".vimrc file - Save this file as .vimrc in your home directory. (e.g. /home/user/.vimrc)
"Author: Robert Pyke

:setlocal spell spelllang=en_us

"-- Syntax Highlighting
syntax on

"-- General --
set ruler           "Show the line and column number of the cursor position

"-- Programming --
set autoindent      "Copy indent from current line when starting a new line

"-- Spaces/Tabs --
set expandtab
set shiftwidth=4
set tabstop=4

"-- Searching --
set hlsearch       "Highlight search results
set ignorecase     "When doing a search, ignore the case of letters
set smartcase      "Override the ignorecase option if the search pattern contains upper case letters

"Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>


"-- Tabbed Editing --
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>:edit 
"Open a file in a new tab by pressing CTRL-O. Prompts for name of file to edit
map <C-O> :tabfind 
"Switch between tabs by pressing Shift-Tab
map <S-Tab> gt


"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start


"-- Tabbed Editing --
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>:edit 
"Open a file in a new tab by pressing CTRL-O. Prompts for name of file to edit
map <C-O> :tabfind 
"Switch between tabs by pressing Shift-Tab
map <S-Tab> gt

map <S-H> <HOME>
map <S-L> <END>
map <S-J> <PAGEDOWN>
map <S-K> <PAGEUP>

set list
"set listchars=tab:▸\ ,eol:¬,trail:. " Same invisibles as in TextMate
set listchars=tab:▸\ ,trail:. " Same invisibles as in TextMate

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

function! CurDir()
    return substitute(getcwd(), '/Users/robert/', "~/", "g")
endfunction


" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L

set wildmode=longest,list
set wildmenu

if exists('+colorcolumn')
    highlight ColorColumn ctermbg=7
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

au! BufRead,BufNewFile *.sls setfiletype sls

filetype plugin on
filetype plugin indent on
