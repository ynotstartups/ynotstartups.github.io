# Custom Commands ...

## Mappings and Commands From Vimrc

| type     | command          | definition                                               |
| -------- | ---------------- | -------------------------------------------------------- |
| inoremap | <S-Tab>          | pumvisible() ? "\<C-p>" : "\<S-Tab>"                     |
| inoremap | <tab>            | Tab_Or_Complete()                                        |
| inoremap | <c-h>            | <left>                                                   |
| inoremap | <c-l>            | <right>                                                  |
| map      | #                | <plug>(asterisk-z#)                                      |
| map      | \*               | <plug>(asterisk-z\*)                                     |
| map      | N                | <plug>(is-nohl)<plug>(anzu-N-with-echo)                  |
| map      | g#               | <plug>(asterisk-gz#)                                     |
| map      | g\*              | <plug>(asterisk-gz\*)                                    |
| map      | n                | <plug>(is-nohl)<plug>(anzu-n-with-echo)                  |
| nmap     | <leader>i        | :call mdip#MarkdownClipboardImage()<cr>                  |
| nmap     | <leader>it       | "%pgstil<delete><delete>I# <esc>                         |
| nmap     | <leader>ha       | <plug>(GitGutterStageHunk)                               |
| nmap     | <leader>hp       | <plug>(GitGutterPreviewHunk)                             |
| nmap     | <leader>hs       | <plug>(GitGutterStageHunk)                               |
| nmap     | <leader>hu       | <plug>(GitGutterUndoHunk)                                |
| nmap     | \[h              | <plug>(GitGutterPrevHunk)                                |
| nmap     | \]h              | <plug>(GitGutterNextHunk)                                |
| nmap     | a                | <plug>(easymotion-overwin-f2)                            |
| nnoremap | <cr>             | ^f\[lrx                                                  |
| nnoremap | <leader>c        | :nohlsearch<cr>                                          |
| nnoremap | <leader>z        | 1z=<cr>g;e                                               |
| nnoremap | '                | \`                                                       |
| nnoremap | <C-J>            | <C-E>                                                    |
| nnoremap | <C-K>            | <C-Y>                                                    |
| nnoremap | \<C-\]>          | g\<C-\]>                                                 |
| nnoremap | <leader>1        | 1gt                                                      |
| nnoremap | <leader>2        | 2gt                                                      |
| nnoremap | <leader>3        | 3gt                                                      |
| nnoremap | <leader>4        | 4gt                                                      |
| nnoremap | <leader>5        | 5gt                                                      |
| nnoremap | <leader><leader> | :Files<cr>                                               |
| nnoremap | <leader>b        | :bprevious<cr>                                           |
| nnoremap | <leader>ed       | :$tabedit ~/Documents/personal-notes/dev_notes.md<cr>    |
| nnoremap | <leader>et       | :JumpToTestFile<cr>                                      |
| nnoremap | <leader>eu       | :UltiSnipsEdit<cr>                                       |
| nnoremap | <leader>ev       | :$tabedit ~/.vimrc<cr>                                   |
| nnoremap | <leader>ez       | :$tabedit ~/.zshrc<cr>                                   |
| nnoremap | <leader>fb       | :Buffers<cr>                                             |
| nnoremap | <leader>fc       | :Commands<cr>                                            |
| nnoremap | <leader>ff       | :Files<cr>                                               |
| nnoremap | <leader>fl       | :BLines<cr>                                              |
| nnoremap | <leader>fm       | :Maps<cr>                                                |
| nnoremap | <leader>fs       | :Snippets<cr>                                            |
| nnoremap | <leader>ft       | :Tags<cr>                                                |
| nnoremap | <leader>fw       | :Rg <c-r><c-w><cr>                                       |
| nnoremap | <leader>hq       | :GitGutterQ<cr>                                          |
| nnoremap | <leader>l        | a[foo](<>)<left><esc>pF\[<right>viw                      |
| nnoremap | <leader>n        | :NERDTreeFind<cr>                                        |
| nnoremap | <leader>q        | <esc>:wqa<cr>                                            |
| nnoremap | <leader>t        | :tabedit %<cr>                                           |
| nnoremap | <leader>yc       | ?^class<cr>wyiw<c-o>:nohlsearch<cr>:echo 'yanked' @+<cr> |
| nnoremap | <leader>yd       | ?def<cr>wyiw<c-o>:nohlsearch<cr>:echo 'yanked' @+<cr>    |
| nnoremap | <leader>yf       | ?def<cr>wyiw<c-o>:nohlsearch<cr>:echo 'yanked' @+<cr>    |
| nnoremap | <leader>yn       | :let @+=expand("%:t")<cr>:echo 'yanked' @+<cr>           |
| nnoremap | <leader>yp       | :let @+=expand("%")<cr>:echo 'yanked' @+<cr>             |
| nnoremap | <space>          | <nop>                                                    |
| nnoremap | H                | gT                                                       |
| nnoremap | L                | gt                                                       |
| nnoremap | Q                | @q                                                       |
| nnoremap | Y                | y$                                                       |
| command! | Black            | :!black %                                                |
| command! | EUltiSnips       | :UltiSnipsEdit                                           |
| command! | Ed               | :$tabedit ~/Documents/personal-notes/dev_notes.md        |
| command! | Ev               | :$tabedit ~/.vimrc                                       |
| command! | Ez               | :$tabedit ~/.zshrc                                       |
| command! | GitGutterQ       | GitGutterQuickFix                                        |
| command! | JumpToTestFile   | call JumpToTestFile()                                    |
| command! | Lint             | :call Lint()                                             |
| command! | SourceVimrc      | :source ~/.vimrc                                         |
| command! | TBindOff         | :call BindOff()                                          |
| command! | TGd              | :Git difftool                                            |
| command! | TGdo             | :Git difftool origin/master...                           |
| command! | TGdot            | :Git difftool -y origin/master...                        |
| command! | TGdt             | :Git difftool -y                                         |
| command! | TLintAll         | :call LintAll()                                          |

## Mappings and Commands From Zshrc

| command                      | type | definition                                                                               |
| ---------------------------- | ---- | ---------------------------------------------------------------------------------------- |
| help                         | A    | run-help                                                                                 |
| e                            | A    | exit                                                                                     |
| s                            | F    | stand up notes related                                                                   |
| sn                           | A    | cd ~/Documents/personal-notes/standup && ~/Documents/dotfiles/copy_last_to_today.py && s |
| g                            | A    | git                                                                                      |
| gs                           | A    | git status                                                                               |
| ,gnew_branch                 | F    |                                                                                          |
| ,pr_review                   | F    | takes PR branch name, fetch reset and open vim with git diff                             |
| ,gdelete_branches            | A    | git branch                                                                               |
| ,virtualenv_setup            | F    |                                                                                          |
| ,activate                    | F    |                                                                                          |
| ,format_lint_test_python     | F    |                                                                                          |
| ,l                           | A    | ,format_lint_test_python                                                                 |
| ,format_lint_test_all_python | F    | TODO: create my own cookie cutter to write new script or python testing codes?           |
| ,la                          | A    | ,format_lint_test_all_python                                                             |
| ,coverage_run                | F    | run coverage with all python files and show missing lines                                |
| ,fzf_find_command            | F    | use fzf to find a custom command                                                         |
| c                            | A    | ,fzf_find_command                                                                        |
| v                            | A    | vim                                                                                      |
| ,vim_git_diff                | A    | vim -c :TGd                                                                              |
| ,vgd                         | A    | vim -c :TGd                                                                              |
| ,vim_git_diff_originmaster   | A    | vim -c :TGdo                                                                             |
| ,vgdo                        | A    | vim -c :TGdo                                                                             |
| ,ev                          | A    | vim ~/.vimrc                                                                             |
| ,ez                          | A    | vim ~/.zshrc                                                                             |
| ,ed                          | A    | vim ~/Documents/personal-notes/dev_notes.md                                              |
| ,ctags_generate_for_python   | A    | ctags \*\*/\*.py                                                                         |
| ,generate_ctags_for_python   | A    | ctags \*\*/\*.py                                                                         |
| ,gh_edit_pr_body             | A    | git log -1 --pretty=format:%b                                                            |
| ,gh_pr_create                | A    | git push && gh pr create --draft --fill-first                                            |
| ,gh_pr_open                  | A    | gh pr view --web                                                                         |
| ,gh_pr_actions_open          | A    | gh pr checks --web                                                                       |
| ,gh_pr_actions_watch         | A    | gh pr checks --watch                                                                     |
| eb                           | A    | ~/Documents/elastic-beanstalk-cli/.venv/bin/eb                                           |
| ,docker_attach_oneview       | F    |                                                                                          |
| ,ssh                         | F    |                                                                                          |
| ,npm_run_frontend            | F    |                                                                                          |
| ,fe                          | A    | ,npm_run_frontend                                                                        |
| ,docker_build_backend        | F    | docker compose build oneview backend with dev dependencies and personal .bashrc          |
| ,be                          | A    | ,docker_build_backend                                                                    |
| ,docker_cp_bashrc            | A    | docker compose cp ~/Documents/personal-notes/.bashrc django:/root/.bashrc                |
| ,mb                          | A    | make bash                                                                                |
| ,ip_of                       | F    | find the ip of a website ,ip_of https://google.com                                       |
| ,copy_last_screenshot        | F    |                                                                                          |
