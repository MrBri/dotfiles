" set encoding=utf8

set number
set ruler
set tabstop=2
set shiftwidth=2

"exit :term
:tnoremap <C-\> <C-\><C-n>
"Still use :E with plugins
:command E Explore
"*Practical Vim
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

set termguicolors " enable true colors, only for >= v0.1.5

" change search (:grep) to ag
set grepprg=ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'		"colorscheme
Plug 'othree/yajs.vim'			"Javascript syntax
Plug 'fatih/vim-go'			"All things Golang
Plug 'neomake/neomake'			"Linting
Plug 'tpope/vim-commentary'		"Comment code
Plug 'editorconfig/editorconfig-vim'	"Pick up .editorconfig
Plug 'sbdchd/neoformat'			"Beautifier, works with Prettier
Plug 'mxw/vim-jsx'			"JSX syntax
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'othree/es.next.syntax.vim'	"ES7 syntax
Plug 'mattn/emmet-vim'			"exapnding abbrevations
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'fleischie/vim-styled-components'  "syntax highlighting for css in js
Plug 'briancollins/vim-jst'		"ejs syntax
Plug 'chr4/nginx.vim'			"nginx syntax
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'	"typescript
Plug 'digitaltoad/vim-pug'		"pug (formally Jade)
Plug 'jparise/vim-graphql'
Plug 'mileszs/ack.vim'

" Add plugins to &runtimepath
call plug#end()

" Theme
syntax enable
colorscheme OceanicNext

 " Neomake
let makers = []
if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
  call add(makers, 'eslint')
endif
if executable('./node_modules/.bin/flow')
  let g:neomake_javascript_flow_exe = './node_modules/.bin/flow'
  call add(makers, 'flow')
endif
let g:neomake_javascript_enabled_makers = makers
autocmd! BufWritePost * Neomake

" deoplete
let g:deoplete#enable_at_startup = 1
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" vim-go
let g:go_fmt_command = "goimports"

" vim-jsx
let g:jsx_ext_required = 0 " https://github.com/avajs/ava/issues/631

" Neoformat for javascript using Prettier.
" autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --write\ --trailing-comma\ es5

" Use formatprg when available
" let g:neoformat_try_formatprg = 1

" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.js Neoformat
" augroup END
"
" let g:neoformat_enabled_javascript = ['eslint_d']

augroup fmt
  autocmd!
  autocmd BufWritePre *.js undojoin | Neoformat eslint_d
augroup END

let mapleader = ","
nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

" fzf bindings
" search open files like tabs
nmap ; :Buffers<CR>
" search all files in current working directory
nmap <Leader>t :Files<CR>
" https://andrew.stwrt.ca/posts/vim-ctags/
nmap <Leader>r :Tags<CR>
