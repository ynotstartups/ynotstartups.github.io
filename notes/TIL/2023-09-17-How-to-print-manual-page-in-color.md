# TIL - How to print manual page in color                            - 17/Sep/23

1. Use `Vim` with `:Man`, you will need `runtime ftplugin/man.vim`
1. open man page with `:Man date`
1. In zshrc `export MANWIDTH=80`, this sets the width to 80 so that the man
   page can fit in one page with correct paragraph indent
1. `:TOhtml` (P.S. I have my own `:TOPrintHtml`)
