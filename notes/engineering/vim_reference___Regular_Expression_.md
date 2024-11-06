# Regular Expression

### Reminders

- `\zs`, `ze`, modify the start or end of regex match, can make replacing or
  searching easier
    - e.g. `\zs` can replace positive look behind`@<=`
    - e.g. `\ze` can replace positive look ahead `@=`
- `\_.` matches all characters and **end of line**, useful for multiline matching
    - `.` matches all characters but not end of line
- `\w` matches word characters, same as `[0-9A-Za-z_]`
- `\s` matches space or tab
- `\{-}` non-greedy match, match as little as possible, this is a multi
    - basically the non-greedy version of `*`

**Intresting Examples**

- `\(def\s\)\@<!foo_function(\_.\{-})` matches function usage and params
  single line or multi lines, but **not** the function definition 
- `def\s\w*(\zs\_.\{-}\ze)` matches only params in function definitions,
  single line or multi lines

### Definition of a pattern in vim

- **atom**: `a` an ordinary character, `\i` a character class, `\(foo\)`
  putting **pattern** in parenthesis making it an atom
- **piece**: **atom** + **multi**, `*`, `\{n,m}`, `{-}`
    - special **multi**, look ahead `\@=`, `\@!`, look behind `\@<=`,`\@<!`, 
- **concat**: **piece** + **piece**, `a*b*`
- **branch**: **concat** `\&` **concat**, `\&` means matching both regex
  patterns, like _AND_
- **pattern**: **branch** `\|` **branch**, `\|` means either patterns, like
  _OR_

