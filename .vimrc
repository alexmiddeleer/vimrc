" enable plugins 
:filetype plugin on

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set title
syntax on
set background=dark
set number
set ignorecase
set smartcase
set wildignore+=*.svn,*/tmp/*,git,*/node_modules/*
set hls
set colorcolumn=90
set directory=$HOME/.vim/swapfiles//
set nowrap
set statusline+=%F\ %l\:%c

" Allow project specific vimrcs
set exrc
set secure

" colo desert
" colo wombat256
" colo zenburn
colo gruvbox
autocmd BufNewFile,BufRead *.jbuilder set syntax=ruby

autocmd FileType c,cpp,java,scala,php let b:comment_leader = '//'
autocmd FileType sh,ruby,python       let b:comment_leader = '#'
autocmd FileType conf,fstab           let b:comment_leader = '#'
autocmd FileType tex                  let b:comment_leader = '%'
autocmd FileType mail                 let b:comment_leader = '>'
autocmd FileType vim                  let b:comment_leader = '"'

let mapleader = "-"
nnoremap <leader>ev :split $MYVIMRC<cr>:normal G<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ss :mksession! ~/vimscripts/last.vim<cr>
nnoremap <leader>ls :source ~/vimscripts/last.vim<cr>
nnoremap <leader>diff :diffthis <cr>  <C-w><C-w> :diffthis <cr>
nnoremap <leader>cc :set cursorcolumn!<cr>
nnoremap <leader>trim :%s/\s*$//g<cr>
nnoremap <Leader>S ?{<CR>jV/^[\t ]*[}\.]<CR>k:sort<CR>:noh<CR>
nnoremap <Leader>o :e %:h <CR>
nnoremap <Leader>v "+P<CR>
nnoremap <Leader>f :Fixmyjs<CR>
nnoremap <c-p> :FZF<cr>
nnoremap <c-a> :Ack<cr>

" set -gdif to git diff current file and gcat to compare side by side
nnoremap <leader>gdif :new \| set buftype=nowrite \| read !git diff #<cr>:set ft=diff<cr>
nnoremap <leader>gcat :new \| set buftype=nowrite \| read !git show HEAD:#<cr>:diffthis<cr><C-w><C-w>:diffthis<cr>

call plug#begin()
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': './install --all --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'sk1418/QFGrep'
Plug 'w0rp/ale'
call plug#end()

"Snipmate
nnoremap <leader>snip :split ~/.vim/plugged/vim-snipmate/snippets/<cr>
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['handlebars'] = 'html.handlebars'

"Ale
" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier']
" " Equivalent to the above.
" let g:ale_fixers = {'javascript': ['prettier'], 'css': ['prettier']}
let g:ale_fix_on_save = 1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
