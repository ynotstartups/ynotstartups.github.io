# TIL - Change date format in bash                                   - 17/Sep/23

TLDR - `date -j -f '%d/%b/%y' $INPUT_DATE +%Y-%m-%d`

- `-f` takes `strftime` format string, `man strftime`
  - turns out python `datetime.strftime` also uses the exact same format
    string, because python internally uses standard c library's `strftime`
- `+%Y-%m-%d` is the output format
- `-j` do not try to set the date, this allows the usage of `-f` and `+` to
  convert one date format to another
