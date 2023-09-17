# TIL - Matches on the second occurrence                             - 17/Sep/23

For example, I want to match on the second `<` of the following line

```
cnoremap <c-j>   <down>
cnoremap <c-k>   <up>
cnoremap <up>    <nop>
cnoremap <down>  <nop>
cnoremap <left>  <nop>
cnoremap <right> <nop>
```

Uses pattern `<.*\zs<`

- `<`   - matches the first `<`
- `.*`  - greedy matches everything after
- `\zs` - resets the start of the pattern matches (a vim specific pattern)
- `<`   - matches the second `<`

**Bonus:**

`sed -n 's/<.*\(<\)/\1/p'`
changes `cnoremap <c-j>   <down>` to `cnoremap <down>`,
something like delete the first `<>`

`sed -n 's/\(<.*\)<.*>/\1/p'`
changes `cnoremap <c-j>   <down>` to `cnoremap <c-j>`,
