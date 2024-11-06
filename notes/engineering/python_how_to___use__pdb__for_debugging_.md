# use `pdb` for debugging

**Debugging after ssh into uat**

**Prerequisite**

Go into the ipython shell e.g. `sudo docker exec -it oneview-django poetry run python manage.py shell`


```python
In [1]: from oneview.graphql.api.charge import one_fee_calculator

In [2]: review_id = "73a07db5-7214-4ead-a9b8-4906e1727a8c"

In [3]: import pdb
        pdb.runcall(one_fee_calculator, review_id)
[1] > /app/backend/oneview/graphql/api/charge.py(248)one_fee_calculator()
-> review = Review.objects.get(id=review_id)
```

If you do the above, you will be dropped into the pdb debugging shell.

Note: please be careful about possible side effects if the functions called
especially if you are doing this in uat or even prod environment.

**pdb**

pdb is an interactive source code debugger for Python programs.

[pdb](https://docs.python.org/3/library/pdb.html#module-pdb) is very powerful, though you need to get familiar with the commands

You can find the pdb commands doc 
[here](https://docs.python.org/3/library/pdb.html#debugger-commands)

Most useful commands I find are

- `ll` - print all source code for the current function or frame
- `b` - breakpoint, you can set breakpoint like so `b oneview/graphql/api/charge.py:254`
- `c` - continue, continue until breakpoint
- `n` - next, continue execution until the next line
- `s` - step, step inside a function
- `sticky` - show whole function while you are debugging, make pdb very much
  like debugging with GUI

