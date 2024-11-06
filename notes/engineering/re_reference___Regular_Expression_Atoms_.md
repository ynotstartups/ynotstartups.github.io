# Regular Expression Atoms

|                           | Rg            | Vim        |
|---------------------------|---------------|------------|
| zero or more              | `?`           | `\?`       |
| 1 or more                 | `+`           | `\+`       |
| precise number of matches | `{n,m}`       | `\{n,m}`   |
| word boundary             | `\b`          | `\< \>`    |
| multiple patterns or      | `|`           | `\|`       |
| non greedy                | `.*?`         | `.\{-}`    |
| line starts with          | `^`           | `^`        |
| line ends with            | `$`           | `$`        |
| group                     | `( )`         | `\( \)`    |
| back reference            | not supported | `\1 \2 \3` |

Example: to match `company` and `companies`

- vim: `compan\(y\|ies\)` 
- rg: `compan(y|ies)`

