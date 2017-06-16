" set encoding=utf8

set number
set ruler

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

" Add plugins to &runtimepath
call plug#end()

" Theme
syntax enable
colorscheme OceanicNext

 " Neomake
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
  let g:neomake_javascript_enabled_makers = ['eslint']
endif
if executable('./node_modules/.bin/flow')
  let g:neomake_javascript_flow_exe = './node_modules/.bin/flow'
  let g:neomake_javascript_enabled_makers = ['flow']
endif
autocmd! BufWritePost * Neomake
let g:neomake_open_list=0

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
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --write\ --trailing-comma\ es5
" Use formatprg when available
let g:neoformat_try_formatprg = 1
augroup fmt
  autocmd!
  autocmd BufWritePre *.js Neoformat
augroup END
