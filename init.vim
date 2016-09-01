" set encoding=utf8

set number
set ruler

:tnoremap <C-\> <C-\><C-n>
:command E Explore

set termguicolors " enable true colors, only for >= v0.1.5

" change search (:grep) to ag
"set grepprg=ag\ --nogroup\ --column\ $*
"set grepformat=%f:%l:%c:%m

call plug#begin('~/.vim/plugged')

Plug 'mhartington/oceanic-next'		"colorscheme
Plug 'othree/yajs.vim'			"Javascript syntax
Plug 'fatih/vim-go'			"All things golang
Plug 'neomake/neomake'			"Linting
Plug 'tpope/vim-commentary'		"Comment code
Plug 'editorconfig/editorconfig-vim'	"Pick up .editorconfig
Plug 'sbdchd/neoformat'			"Beautifier

" Add plugins to &runtimepath
call plug#end()

 " Theme
syntax enable
colorscheme OceanicNext
set background=dark

 " Neomake
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
if executable('./node_modules/.bin/eslint')
  let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
endif
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
let g:neomake_open_list=2
