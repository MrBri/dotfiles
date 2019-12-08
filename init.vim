set encoding=UTF-8

let mapleader = ","
set number
set ruler
set tabstop=2
set shiftwidth=2
set autowrite
set expandtab
set nowrap
set mouse=a
" for vim 8 or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
set updatetime=100

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

"exit :term
:tnoremap <C-\> <C-\><C-n>
"Still use :E with plugins
:command E Explore
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Smart way to move between windows (<ctrl>j etc.)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs. Replace with TMUX?
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>te :tabedit .<cr>

" Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" change search (:grep) to ag
" set grepprg=ag\ --nogroup\ --column\ $*
" set grepformat=%f:%l:%c:%m
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" vim-markdown-composer
" function! BuildComposer(info)
"   if a:info.status != 'unchanged' || a:info.force
"     if has('nvim')
"       !cargo build --release
"     else
"       !cargo build --release --no-default-features --features json-rpc
"     endif
"   endif
" endfunction

call plug#begin('~/.vim/plugged')

" Core
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'		                                      "colorscheme

Plug 'morhetz/gruvbox'                                                    "colorscheme
Plug 'tpope/vim-commentary'		                                            "Comment code
Plug '/usr/local/opt/fzf'                                                 "Be sure fzf is installed with Homebrew
Plug 'junegunn/fzf.vim'                                                   "vim friendly fzf
Plug 'w0rp/ale'                                                           "Lint, fix...

Plug 'AndrewRadev/splitjoin.vim'

" Syntax highlighting
Plug 'fatih/vim-go'			                                                  "All things Golang
Plug 'chr4/nginx.vim'			                                                "nginx syntax
Plug 'hashivim/vim-terraform'                                             "Terraform tool
Plug 'jparise/vim-graphql'                                                "Graphql syntax
" Plug 'pangloss/vim-javascript'                                            "Do I need both?
Plug 'othree/yajs.vim'			                                              "Javascript syntax
Plug 'HerringtonDarkholme/yats.vim'			                                  "Typescript syntax
" Plug 'othree/es.next.syntax.vim'	                                        "ES7 syntax
" Plug 'carlitux/deoplete-ternjs'
" Plug 'HerringtonDarkholme/yats.vim'	                                      "Typescript syntax
" Plug 'mxw/vim-jsx'			                                                  "JSX syntax
" Plug 'fleischie/vim-styled-components'                                    "syntax highlighting for css in js
" Plug 'digitaltoad/vim-pug'		"pug (formally Jade)
" Plug 'briancollins/vim-jst'		"ejs syntax
" Plug 'briancollins/vim-jst'		"ejs syntax

" Visual
Plug 'vim-airline/vim-airline'                                            "Status/tabline works with Ale
Plug 'mhinz/vim-signify'                                                  "Git changes
Plug 'tpope/vim-fugitive'                                                 "Git integration

" Tools
Plug 'SirVer/ultisnips'                                                   "Snippet engine
Plug 'honza/vim-snippets'                                                 "Actual snippets

" Team friendly
Plug 'editorconfig/editorconfig-vim'	                                    "Pick up .editorconfig

" Get better at
Plug 'mattn/emmet-vim'			                                              "exapnding abbrevations

" Not sure yet
" Plug 'AndrewRadev/splitjoin.vim'	                                        "Splint or join objects/structs
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'mileszs/ack.vim'
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'chrisbra/unicode.vim'

" Add plugins to &runtimepath
call plug#end()

" Theme
" colorscheme gruvbox
" gruvboxsyntax enable
syntax enable
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

let g:rehash256 = 1
let g:molokai_original = 1

" fzf: bindings
" Ctrl-p but also set command-p in Therm (iterm2) in keyboard tab to :Files\n
nnoremap <c-p> :Files<CR>
" search open files like tabs
nmap <leader>b :Buffers<CR>
" search all files in current working directory
" nmap <leader>t :Files<CR>
" https://andrew.stwrt.ca/posts/vim-ctags/
nmap <leader>r :Tags<CR>
nmap <leader>; :Commands<CR>
nnoremap <silent> <leader>` :Marks<CR>
inoremap <silent> <F3> <ESC>:Snippets<CR>

" UltiSnips: Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ALE:
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'yaml': ['prettier'],
\   'yml': ['prettier'],
\   'json': ['jq', 'prettier'],
\   'typescript': ['tslint', 'prettier', 'eslint'],
\}
nmap <leader>af :ALEFix<CR>
" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
" When working with TypeScript files, ALE supports automatic imports from external modules. This behavior is disabled by default and can be enabled by setting:
" See :help ale-completion for more information.
let g:ale_completion_tsserver_autoimport = 1
let g:ale_set_balloons = 1

" Neomake:
" let makers = []
" if executable('./node_modules/.bin/eslint')
"   let g:neomake_javascript_eslint_exe = './node_modules/.bin/eslint'
"   call add(makers, 'eslint')
" endif
" if executable('./node_modules/.bin/flow')
"   let g:neomake_javascript_flow_exe = './node_modules/.bin/flow'
"   call add(makers, 'flow')
" endif
" let g:neomake_javascript_enabled_makers = makers
" autocmd! BufWritePost * Neomake

" deoplete
" let g:deoplete#enable_at_startup = 1
" " Use deoplete.
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Fugitive
nmap <leader>gd :Gdiff<CR>

" Vim-go:
let g:go_fmt_command = "goimports"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_test_timeout = '10s'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" vim-jsx
" let g:jsx_ext_required = 0 " https://github.com/avajs/ava/issues/631

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
" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.js undojoin | Neoformat eslint_d
" augroup END
" nnoremap <leader>f mF:%!eslint_d --stdin --fix-to-stdout<CR>`F

autocmd BufNewFile,BufRead *.conf set syntax=nginx " set nginx syntax for all .conf files
autocmd BufNewFile,BufRead config set ft=yaml " set yaml syntax for all config files

"*Practical Vim
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" vimiki
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" coc.snippets 
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
