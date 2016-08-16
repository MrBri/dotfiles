set encoding=utf8

execute pathogen#infect()

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme OceanicNext
set background=dark
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

set number
:tnoremap <C-\> <C-\><C-n>

" change search (:grep) to ag
set grepprg=ag\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = 'eslint'

