# Extract Manpage Table of Content

```man
ZSHMISC(1)                   General Commands Manual                  ZSHMISC(1)
NAME
       zshmisc - everything and then some
SIMPLE COMMANDS & PIPELINES
       A simple command is a sequence of optional parameter assignments followed
       ...
PRECOMMAND MODIFIERS
       A simple command may be preceded by a precommand modifier, which will
       ...
```

I would like the extract a Table of Content from manual page such as below

```man
SIMPLE COMMANDS & PIPELINES
PRECOMMAND MODIFIERS
```

1. `:redir @a`  - setup redirect to register `a`
2. `:g/^\u.*/p` - find all lines start with upper case and print them 
3. `:redir END` - end the redirection
4. `"ap`        - paste content in register a 

