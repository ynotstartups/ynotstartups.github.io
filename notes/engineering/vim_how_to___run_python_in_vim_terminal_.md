# run python in vim terminal


```vim
:py3 print('abc')

# to change lines in range
:'<,'>py3do return line.split(":")[0] + ' = ' + line.split(":")[0].strip() + ','

# run foo.py in current directory, have access to all vim_python objects
# see `:help python-command`
:pyfile foo.py

# For example
#
# > cat foo.py
# vim.command('buffers a')
# for b in vim.buffers:
#     print(b)
#     print(b.__dir__())
#     print(b.valid)
# visible_buffers = [window.buffer for window in vim.current.tabpage.windows]
```
