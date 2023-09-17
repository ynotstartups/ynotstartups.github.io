# TIL - gq: formatoption                                             - 05/Sep/23

Current formatoption for markdown is `formatoption=jtln` from `set formatoptions?`

```
						*fo-j*
```

j	Where it makes sense, remove a comment leader when joining lines.  For
example, joining:
int i;   // the index ~
// in the list ~
Becomes:
int i;   // the index in the list ~

```
						*fo-t*
```

t	Auto-wrap text using 'textwidth'

```
						*fo-l*
```

l	Long lines are not broken in insert mode: When a line was longer than
'textwidth' when the insert command started, Vim does not
automatically format it.

```
						*fo-n*
```

n	When formatting text, recognize numbered lists.  This actually uses
the 'formatlistpat' option, thus any kind of list can be used.  The
indent of the text after the number is used for the next line.  The
default is to find a number, optionally followed by '.', ':', ')',
'\]' or '}'.  Note that 'autoindent' must be set too.  Doesn't work
well together with "2".
Example: >
1\. the first item
wraps
2\. the second item
