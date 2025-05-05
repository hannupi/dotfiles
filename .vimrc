colorscheme slate
let mapleader=" "
nnoremap <Tab> :Explore<CR>

set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set smarttab
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
set relativenumber              " show line numbers relative to cursor position
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set tags=tags                   " CTags file
set noswapfile

nnoremap ; :
nnoremap , ;

augroup diffcolors
    autocmd!
    autocmd Colorscheme * call s:SetDiffHighlights()
augroup END

function! s:SetDiffHighlights()
    if &background == "dark"
        highlight DiffAdd gui=bold guifg=none guibg=#2e4b2e
        highlight DiffDelete gui=bold guifg=none guibg=#4c1e15
        highlight DiffChange gui=bold guifg=none guibg=#45565c
        highlight DiffText gui=bold guifg=none guibg=#996d74
    else
        highlight DiffAdd gui=bold guifg=none guibg=palegreen
        highlight DiffDelete gui=bold guifg=none guibg=tomato
        highlight DiffChange gui=bold guifg=none guibg=lightblue
        highlight DiffText gui=bold guifg=none guibg=lightpink
    endif
endfunction
