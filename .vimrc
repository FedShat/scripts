packloadall
silent! helptags ALL

set vb t_vb=
set mouse=nvi
packadd termdebug
set laststatus=2
set hlsearch
set showmatch
set wildmenu
set showcmd
set number
set history=10000
colorscheme onehalfdark
set background=dark
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

let g:airline_theme='onehalfdark'

function Compile()
    let res = '"/tmp/' . expand('%:t:r') . '.o"'
    if expand('%:e') ==? 'cpp'
        exec '!clang++ -std=gnu++17 -DLOCAL -O0 -g -Wextra -fsanitize=undefined,array-bounds,address "%" -o ' . res
    elseif expand('%:e') ==? 'c'
        exec '!clang -DLOCAL -O0 -g -Wextra -fsanitize=undefined,array-bounds,address "%" -o ' . res
    endif
endfunction

function Run()
    let name = '/tmp/' . expand('%:t:r') . '.o'
    if filereadable(name)
        exec '!' . '"' . name . '"'
    elseif expand('%:e') ==? 'py'
        !python3 %
    endif
endfunction

noremap <f1> :call Compile()<CR>
noremap <f2> :call Run()<CR>

"xnoremap "+y y:call system("wl-copy", @")<cr>
"nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
"nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

let g:ale_linters = {
\     'go': ['gofmt', 'gobuild', 'govet', 'golint'],
\}

let g:ale_linters = {
    \    'cpp': ['g++'],
    \}

let g:ale_completion_enabled=1
let b:ale_fixers = [
\    'remove_trailing_lines',
\    'trim_whitespace',
\    'clangtidy',
\    'clang-format',
\    'gofmt',
\]

let g:ale_lint_on_insert_leave=1
let g:ale_c_clangformat_options='--style="{BasedOnStyle: llvm, IndentWidth: 4, AllowShortFunctionsOnASingleLine: None, AllowShortIfStatementsOnASingleLine: Never, Standard: Auto}"'

nmap <F8> <Plug>(ale_fix)
nmap <F7> <Plug>(ale_go_to_definition)

