# TIL - ASCII encoding                                               - 02/Sep/23

**hexadecimal dump of ascii charaters**

from `man ascii`

```
00 nul   01 soh   02 stx   03 etx   04 eot   05 enq   06 ack   07 bel
08 bs    09 ht    0a nl    0b vt    0c np    0d cr    0e so    0f si
10 dle   11 dc1   12 dc2   13 dc3   14 dc4   15 nak   16 syn   17 etb
18 can   19 em    1a sub   1b esc   1c fs    1d gs    1e rs    1f us
20 sp    21  !    22  "    23  #    24  $    25  %    26  &    27  '
28  (    29  )    2a  *    2b  +    2c  ,    2d  -    2e  .    2f  /
30  0    31  1    32  2    33  3    34  4    35  5    36  6    37  7
38  8    39  9    3a  :    3b  ;    3c  <    3d  =    3e  >    3f  ?
40  @    41  A    42  B    43  C    44  D    45  E    46  F    47  G
48  H    49  I    4a  J    4b  K    4c  L    4d  M    4e  N    4f  O
50  P    51  Q    52  R    53  S    54  T    55  U    56  V    57  W
58  X    59  Y    5a  Z    5b  [    5c  \    5d  ]    5e  ^    5f  _
60  `    61  a    62  b    63  c    64  d    65  e    66  f    67  g
68  h    69  i    6a  j    6b  k    6c  l    6d  m    6e  n    6f  o
70  p    71  q    72  r    73  s    74  t    75  u    76  v    77  w
78  x    79  y    7a  z    7b  {    7c  |    7d  }    7e  ~    7f del
```

The control characters in ASCII still in common use include:

- `0x00 (null, NUL, \0, ^@)`, originally intended to be an ignored character, but now used by many programming languages including C to mark the end of a string.

- `0x07 (bell, BEL, \a, ^G)`, which may cause the device to emit a warning such as a bell or beep sound or the screen flashing.

- `0x08 (backspace, BS, \b, ^H)`, may overprint the previous character.

- `0x09 (horizontal tab, HT, \t, ^I)`, moves the printing position right to the next tab stop.

- `0x0A (line feed, LF, \n, ^J)`, moves the print head down one line, or to the left edge and down. Used as the end of line marker in most UNIX systems and variants.

- `0x0B (vertical tab, VT, \v, ^K)`, vertical tabulation.

- `0x0C (form feed, FF, \f, ^L)`, to cause a printer to eject paper to the top of the next page, or a video terminal to clear the screen.

- `0x0D (carriage return, CR, \r, ^M)`, moves the printing position to the start of the line, allowing overprinting. Used as the end of line marker in Classic Mac OS, OS-9, FLEX (and variants). A CR+LF pair is used by CP/M-80 and its derivatives including DOS and Windows, and by Application Layer protocols such as FTP, SMTP, and HTTP.

- `0x1A (Control-Z, SUB, ^Z)`, Acts as an end-of-file for the Windows text-mode file i/o.

- `0x1B (escape, ESC, \e (GCC only), ^[)`. Introduces an escape sequence.

- Control characters may be described as doing something when the user inputs them, such as code 3 (End-of-Text character, ETX, ^C) to interrupt the running process, or code 4 (End-of-Transmission character, EOT, ^D), used to end text input on Unix or to exit a Unix shell. These uses usually have little to do with their use when they are in text being output.

**to see the hex value for characters**

`od -t a -t x1 -t c`

- `-t a`  - prints in ascii format
- `-t x1` - prints in hex format
- `-t c`  - prints in c escape format

e.g.

```
❯ printf '\0\a\b\n\r\t\v ' | od -t a -t x1 -t c
0000000  nul bel  bs  nl  cr  ht  vt  sp
          00  07  08  0a  0d  09  0b  20
          \0  \a  \b  \n  \r  \t  \v
0000010
```

**Understanding the color escape code**

`\033` is actually ESC character in ascii octal format,
`\e` is equivalent in zsh shell, however, don't use `\e`,
`\e` is not recognised in `awk` nor `python`.

```
> echo "\033[31mRed Text\033[0m"
Red Text
❯ echo "\e[31mRed Text\e[0m"
Red Text
```

- `\033[`  - Begin the color modifications
- `CODEm` - CODE + `m` at the end
- `\e[0m`  - End the color modifications

| code | description    |
| ---- | -------------- |
| `30` | fg black       |
| `31` | fg red         |
| `32` | fg green       |
| `33` | fg brown       |
| `34` | fg blue        |
| `35` | fg purple      |
| `36` | fg cyan        |
| `37` | fg light grey  |
| `40` | bg black       |
| `41` | bg red         |
| `42` | bg green       |
| `43` | bg brown       |
| `44` | bg blue        |
| `45` | bg purple      |
| `46` | bg cyan        |
| `47` | bg light grey  |
| `0`  | reset / normal |
| `1`  | bold           |
| `3`  | italic         |
| `4`  | underline      |

```bash
❯ for i in {1..111}
do
    echo '\\e['$i'm' "\e[${i}mtext\e[0m"
done | column
```
