" set encoding=utf8

set number

:tnoremap <C-\> <C-\><C-n>

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif

"let g:airline_theme='oceanicnext'
"let g:airline_powerline_fonts = 1

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

" Add plugins to &runtimepath
call plug#end()

 " Theme
 syntax enable
 colorscheme OceanicNext
 set background=dark

 " Neomake
" let g:neomake_logfile = '/usr/local/var/log/neomake.log'
let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
