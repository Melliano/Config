call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'kyoh86/momiji', { 'rtp': 'vim' }
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'scrooloose/nerdtree'
Plug 'OmniSharp/omnisharp-vim'
Plug 'prettier/vim-prettier', {'do': 'npm install', 'branch':'release/1.x'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'puremourning/vimspector'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'ianks/vim-tsx'
call plug#end()
let mapleader = ","
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_section_b = '%{strftime("%H:%M")}'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
" Applying code actions to the selected code block.
" Example: `<leader>aap` for current paragraph
xmap <leader>ga  <Plug>(coc-codeaction-selected)
nmap <leader>ga  <Plug>(coc-codeaction-selected)
nmap <leader>ga  <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
autocmd CursorHold * silent call CocActionAsync('highlight')
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" GoTo code navigation
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd FileType * nmap <silent> gd <Plug>(coc-definition)
autocmd FileType * nmap <silent> gy <Plug>(coc-type-definition)
autocmd FileType * nmap <silent> gi <Plug>(coc-implementation)
autocmd FileType * nmap <silent> gr <Plug>(coc-references)
autocmd FileType cs nnoremap <silent> gu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <silent> gi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <silent> ga :OmniSharpGetCodeActions<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <Esc> <C-\><C-n>
nnoremap <C-h> <C-\><C-n><C-w>h
nnoremap <C-j> <C-\><C-n><C-w>j
nnoremap <C-k> <C-\><C-n><C-w>k
nnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap("N", "Nzzzv")
nnoremap("n", "nzzzv")


autocmd FileType ts nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
autocmd FileType html nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#pum#next(1) :
"      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Symbol renaming.
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
nmap <leader>rn <Plug>(coc-rename)

colorscheme gruvbox
syntax on
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

set rtp+=/usr/local/opt/fzf
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set guicursor=
set expandtab
set smartindent
set incsearch
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab=true
"set smartindent=true
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undofile
set undodir=~/.vim/undodir
set hidden
set nohlsearch
set nu
set incsearch
set updatetime=300

let g:SuperTabMappingForward = '<S-Tab>'
let g:SuperTabMappingBackward = '<Tab>'
let g:fzf_preview_window = 'right:60%'
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']
nnoremap <silent> <Leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


nnoremap <silent>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name ios -o -name android\) -prune -o -print'

let g:ale_linters = { 
\ 'cs' : ['OmniSharp'],
\ 'typescript' : ['eslint'],
\}

let g:ale_fixers = { 
\ 'typescript' : ['eslint'], 
\}
" For Coc Action Menu to work.
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
let g:OmniSharp_server_use_net6 = 1
let g:ale_fix_on_save = 1
nmap <leader>ne :NERDTree<cr>
map <C-p> :GFiles<cr>
map <C-f> :Files<cr>
