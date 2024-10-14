# Software Engineering Notes

# Cheatsheet Vim

## Reminders

- `gsp` - motion pending operator to change anything to param style `foo=foo`
- `/foo/;/bar` - search the first `bar` after `foo`

# Cheatsheet Vim - Regular Expression

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

# Cheatsheet Rg

|                           |                                                |
|---------------------------|------------------------------------------------|
| `-F, --fixed-strings`     | Fixed String Matches                           |
| `-t py`                   | select only python files                       |
| `-w, --word-regexp`       | Word Regexp                                    |
| `-f, --file PATTERNFILE`  | search for all patterns,  one pattern per line |
| `-s`                      | case sensitive                                 |
| `-i`                      | case insensitive                               |
| `-S`                      | smart case                                     |
| `-g "**/tests/**"`        | search only tests files with glob              |
| `-g "!**/tests/**"`       | don't search test files with inverse glob `!`  |
| `--stats`                 | number of matches, number of line matches      |
| `--sort created/modified` | sort results by file created/modified time     |
| `-p, --pretty`            | `rg -p foo | less`, pipe color to other program |


## Multi lines matching

**Find Python Function Definitions and Usages**

```
# this prints Definitions too because I don't know how to ignore lines
# starts with `def`
# 
# [^,] for removing imports

rg --multiline --multiline-dotall 'foo_function_name\(.*?\)[^,]' -g "!**/tests**"
```

## Search For Different Casing

`foo_?bar` searches for `foo_bar`, `FOO_BAR`, `FOOBAR`, `fooBar`

it works because

1. `_?` means `_` is optional, i.e. the searched words can contain 0 or 1 `_`
2. The search is case insensitive by default

## Copy Rg result into pasteboard for PR description...

`rg foo --heading --line-number | pbcopy`

Example output below

```
dev_notes.md
65:## Usage Example Of curo_request_kwargs
67:`_curo_request`
```
# Cheatsheet Regular Expression

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

## matches different suffixes

Example: to match `company` and `companies`

- vim: `compan\(y\|ies\)` 
- rg: `compan(y|ies)`

# Cheatsheet Writings

Scrupulous writers, in every sentence that they write, will ask themselves at least four questions:

1. What am I trying to say?
1. What words will express it?
1. What image or idiom will make it clearer?
1. Is this image fresh enough to have an effect?

Two more that they may ask are:

1. Could I put it more shortly?
1. Have I said anything that is avoidably ugly?

Consequently there are ways to write well. The following rules will cover most cases:

1. Never use a metaphor, simile or other figure of speech which you are used to seeing in print.
1. Never use a long word where a short one will do.
1. If it is possible to cut a word out, always cut it out.
1. Never use the passive where you can use the active.
1. Never use a foreign phrase, a scientific word or a jargon word if you can think of an everyday English equivalent.
1. Break any of these rules sooner than say anything outright barbarous.

# Cheatsheet Software Engineering

## Give Consistent Code Review

- add `doc string` if there is anything unclear
- understand **all** code and tests added/modified
- handle network and other errors gracefully?
- read and test my comments carefully
- add ideas about incremental improvements

## Behavioral - Personal growth

- There is No Such Thing as Over Communication!
- Look for opportunity for incremental improvement
- Read documentation/manual/user’s guide before using a new tool/cli
    - this implies prefer using tool with good doc e.g. `fish` instead `bash`
- Be more curious about how things work internally
- Be prepared because I am bad at ac-hoc talk and thinking
    - ask for agenda for meetings so that I can be prepared
- Validate assumptions earlier
- For meetings,
    - gather questions before meeting
    - set out the purpose of the meetings
    - write meeting minutes and action points


## Documentations - Building structures with natural language

- Write non-code How To, repeatable steps for public or personal, e.g.
    - How-To deploy UAT
    - How-To add a graphql endpoint 
- Write code comments, documentations before implementation 
    - remember the 4 types of documentation, Tutorial, How-To Step by Step Guides,
      Explanation, Reference
- Present tense and full sentence

## Design - Writing good code

- Design it twice
    - write down two designs, each with pros and cons, then perhaps there will
      appear a third design with combined pros and less cons
- Architect great design rather than just working codes, then writing comments
  should be fun since that’s how you identify the best design
- reduce complexity by adding or removing abstraction
- Design Goal: reliable, scalable, maintainable

# Cheatsheet cheatsheet

**Best Practices**

1. Keep cheatsheet and TIL one page long (after render to pdf)
2. Consider if I should print them out

# Cheatsheet Django

## Best Practices

- `models` field
    - use `help_text` as documentation
    - use `unique=True` is this field must be unique throughout the table 

## Q & F

- `Q()` - represents an SQL condition that can be used in database-related
  operations
- `F()` - represents the value of a model field or annotation

These two make it possible to define and reuse conditions.


# Cheatsheet Serverless

- deploy - `sls deploy`
- package to local directory for inspection 
    - `serverless package --package ./package-with-azure-upload` 

## inspect package size

```bash
sls package --package ./package-with-azure-upload
cd package-with-azure-upload
unzip oneview-serverless.zip -d ./unzipped
du -h -d 1 ./unzipped | sort --human-numeric-sort
```

# Cheatsheet Python 

## a decorator to figure out the order of how functions or methods are Called 

```python
def print_function_name(func):
    def _print_function_name(*args, **kwargs):
        print(f"--> begin:  {func.__name__}")
        result = func(*args, **kwargs)
        print(f"--> return: {func.__name__}")
        return result
    return _print_function_name
```

## ipython autoload 

reload modules when user executes code, so that I don't need to exit ipython
shell to reload edited code.

```
%load_ext autoreload
%autoreload 2
```

# Cheatsheet Postgres 
|                     |                             |
|---------------------|-----------------------------|
| `\l`                | list databases              |
| `\c DATABASE NAME`  | connect/switch to database  |
| `\dt`               | list tables                 |
| `\d TABLE NAME`     | describe table              |
| `\o FILE NAME` `\o` | save query result to a file |
| `\! shell command`  | run external shell command  |

You can do `\l` to list all the databases, use `\c` to connect to one database,
use `\d` to list tables in this database

## Drop column 
```
ALTER TABLE oneview_frozencharge DROP COLUMN product_fee_charge_is_user_input_required;
```

## rename table
```
ALTER TABLE oneview_incomeprofile RENAME COLUMN business_unit_id TO adviser_business_unit_id;
ALTER TABLE oneview_incomeprofile RENAME COLUMN adviser_business_unit_id TO business_unit_id;
```

## save query result to a file
```
# start
\o data.txt

# ...run the psql commands...e.g. \dt

# ended
\o
```

```
docker-compose --file docker-compose-dev.yml exec postgres cat data.txt
```


# Cheatsheet Bookmarklet

```
document.querySelectorAll(".pr-toolbar").forEach(el => el.remove());
```

https://caiorss.github.io/bookmarklet-maker/

```javascript
// print PR
document.querySelectorAll(".pr-toolbar").forEach(e => e.remove());
window.scrollTo(0, 0);
window.location.href = document.URL + '?diff=unified&w=0';
```


```javascript
// print fish shell doc
document.querySelectorAll('.sphinxsidebar').forEach(e => e.remove())
document.querySelectorAll('.bodywrapper').forEach(e => e.style.marginLeft = "0")
```

# Cheatsheet vim9script

## vim9script examples

### vim function and variable `var`

```vim
# vim9script reminder
# use `var` to define variable, instead of `let`

# boolean
true
false

# option value &foo 
echo &number
# assigns value to option
&number = 1

# contents of register `q`
echo @q
# remove or set contents of register `q`
@q = ""
# set register q in linewise mode
setreg('q', '', 'V')

# string concatenation
var foo = "abc" .. "def"
# string interpolation
var name = "tiger"
echo $"hello {name}!"

# setting variable name to register
# @0 is last yanked text
var name = @0

# list
var foo_list = [1, 2, 3]
var first_item = foo_list[0]
var first_two_items = foo_list[0 : 2]
var last_two_items = foo_list[-2 : ]
# list concatenation
var foo_list_extended = foo_list + [4, 5] 
# builtin list methods
mylist->add(val1)->add(val2)
mylist->copy()
mylist->count(val)
mylist->empty()
mylist->extend(otherlist)
mylist->filter(expr2)
mylist->flatten()
mylist->foreach(expr2)
mylist->indexof(expr)
mylist->insert(item)
mylist->join()
mylist->len()
mylist->map(expr2)
mylist->max()
mylist->min()
mylist->remove(idx)
mylist->repeat(count)
mylist->reverse()
mylist->sort()
mylist->string()
mylist->type()
mylist->uniq()

# dictionary
var foo = {"a": 1, "b": 2, "c": 3}
echomsg foo["a"]
for [key, value] in foo->items()
    echomsg key value
endfor
# dictionary methods
mydict->has_key(key)
mydict->items()
mydict->keys()
mydict->values()

# if
var a = 1.5
if a > 2
    echo "a > 2" a
elseif a > 1
    echo "a > 1" a
else
    echo "a < 1" a
endif

# for loop
var foo = [1, 2, 3]
for i in foo
    echo i
endfor

# regex match, right hand side string is used as a pattern
# echo true
echo "foo" =~ '^f.*'
# echo false
echo "foo" =~ 'b.*'

# powerful commands

# execute the string from the evaluation of {expr1} as an cli # command
execute "normal @q"

# calling vim builtin function, see `:help builtin.txt`
# see help for builtin function `substitute` at `:help substitude()`
var remove_prefix = substitute(posix_file_path, '^saltus/', '', 'g')

# Types

float, string, bool, number, float, string, blob, list<type>, dict<type>, job,
channel, func
```

### Example function implementation

```vim
def GetWordAfterPrefix(prefix_string: string): string
  # search for the line number and column number for the prefix_string
  # e.g. the line and column of character 'f' in `def \zsfoo` 
  # flag `b` - search backward  
  # flag `n` - do not move the cursor
  # see also `:help search()`
  var [match_line_number, match_col_number] = (prefix_string .. '\zs')->searchpos('bn')
  var line = getline(match_line_number)
  # get the word with matching column position - 1, `-1` is needed to include
  # the first character of the word, e.g. word would be `foo`
  var word = line->matchstr('\w*', match_col_number - 1)
  return word
enddef

def g:YankWordAfterPrefix(prefix_string: string)
  var word = GetWordAfterPrefix(prefix_string)
  echom 'yanked' word
  setreg('+', word)
enddef

nnoremap <leader>yf :call YankWordAfterPrefix("def ")<cr>
nnoremap <leader>yc :call YankWordAfterPrefix("class ")<cr>

def GetPythonFileImportPath(): string
    var posix_file_path = expand("%")
    var python_import_path = posix_file_path
                                ->substitute('^saltus/', '', 'g')
                                ->substitute('.py$', '', 'g')
                                ->substitute('/', '.', 'g')
    return python_import_path
enddef
```

### Using python in vim

```vim
def g:JumpToTestFile()
py3 << EOF
from vim_python import get_or_create_alternative_file

# vim.eval("@%") gets the filepath in current buffer
test_filepath = get_or_create_alternative_file(filepath=vim.eval("@%"))

# open test_filepath in current window
vim.command(f"tabnew {test_filepath}")
EOF
enddef
```
### running a vimscript file foo.vim

```bash
> cat foo.vim
vim9script
var a = [1, 2, 3]
echomsg a
> vim -S foo.vim
```

# Book - Designing Data-Intensive Applications                      - 23/May/24

## ACID, atomicity and isolation, page 228

**Atomicity**

If an error occurs halfway through a sequence of writes, the transaction should
be aborted, and the writes made up to that point should be discarded. In other
words, the database saves you from having to worry about partial failure, by
giving an all-or-nothing guarantee.

**Isolation**

Concurrently running transactions shouldn't interfere with each other. For
example, if one transaction makes several writes, then another transaction
should see either all or none of those writes, but not some subset.

## Key feature of transaction, page 231

A key feature of a transaction is that it can be aborted and safely retried if
an error occurred. ACID databases are based on this philosophy: if the
database is in danger of violating its guarantee of atomicity, isolation, or
durability, it would rather abandon the transaction entirely than allow it to
remain half-finished.

## Faults and Partial Failures, page 274

There is no fundamental reason why software on a single computer should be
flaky: when the hardware is working correctly, the same operation always
produces the same result (it is deterministic). If there is a hardware
problem, the consequence is usually a total system failure.

In a distributed systems, there may well be some parts of the system that are
broken in some unpredictable way, even though other parts of the system are
working fine. This is known as partial failure. The difficulty is that partial
failures are non-deterministic: if you try to do anything involving multiple
nodes and the network, it may sometimes work and sometimes unpredictably fail.

This non-determinism and possibility of partial failures is that makes
distributed systems hard to work with.

## Why do we need distributed system?, page 311

Scalabilty is not the only reason for wanting to use a distributed system.
Fault tolerance and low latency (by placing data geographically close to
users) are equally important goals, and those things can not be achieved with
a single node.

## System Models, page 307

we somehow formalize the kinds of faults that we expect to happen in a system.
We do this by defining a system model, which is an abstraction that describes
what things an algorithm may assume.

## System Models regarding timing assumptions

**Synchronous model**

The synchronous model assumes bounded network delay, bounded process pauses,
and bounded clock error. This does not imply exactly synchronized clocks or
zero network delay; it just means you know that network delay, pauses, and
clock drift will never exceed some fixed upper bound. The synchronous
model is not a realistic model of most practical systems, because (as
discussed in this chapter) unbounded delays and pauses do occur.

**Partially synchronous model** - Realistic Assumption

Partial synchrony means that a system behaves like a synchronous system most
of the time, but it sometimes exceeds the bounds for network delay, process
pauses, and clock drift. This is a realistic model of many systems: most of
the time, networks and processes are quite well behaved—otherwise we would
never be able to get anything done—but we have to reckon with the fact that
any timing assumptions may be shattered occasionally. When this happens,
network delay, pauses, and clock error may become arbitrarily large.

## System Models regarding node failures

**Crash-stop faults**

In the crash-stop model, an algorithm may assume that a node can fail in only
one way, namely by crashing. This means that the node may suddenly stop
responding at any moment, and thereafter that node is gone forever—it never
comes back.

**Crash-recovery faults** - Realistic Assumption

We assume that nodes may crash at any moment, and perhaps start responding
again after some unknown time. In the crash-recovery model, nodes are assumed
to have stable storage (i.e., nonvolatile disk storage) that is preserved across
crashes, while the in-memory state is assumed to be lost.

## Definition of Stream

In general, a "stream" refers to data that is incrementally made available
over time.The concept appears in many places: in the`stdin` and `stdout` of
Unix, programming languages (lazy lists), filesystem APIs (such as Java's
`FileInputStream`)

# TIL - Python: Set Timeout In Requests Library                     - 08/Aug/23

```python3
# timeout = (connect timeout, read timeout)
requests.get('https://github.com', timeout=(3, 27))
```

> By default, requests do not time out unless a timeout value is set
> explicitly. Without a timeout, your code may hang for minutes or more.
> It’s a good practice to set connect timeouts to slightly larger than a
> multiple of 3, which is the default TCP packet retransmission window.
Doc from requests

# TIL - Python: Assert Logs With Python Unittest                    - 08/Aug/23

```python3
with self.assertLogs('foo', level='INFO') as cm:
    logging.getLogger('foo').info('first message')
    logging.getLogger('foo.bar').error('second message')
self.assertEqual(cm.output, ['INFO:foo:first message',
                             'ERROR:foo.bar:second message'])
```

https://docs.python.org/3/library/unittest.html#unittest.TestCase.assertLogs

# TIL - Bash: Command env for printing environment variabls in shell- 08/Aug/23

```bash
$ docker run ubuntu env
```

```bash
$ env

PYTHONUNBUFFERED=1
CELERY_BROKER_URL=amqp://guest:guest@rabbitmq:5672//
CHOKIDAR_USEPOLLING=true
HOSTNAME=af072bc9372e
PYTHON_VERSION=3.8.17
CELERY_RESULT_BACKEND=django-db
PWD=/app/backend
PYTHON_SETUPTOOLS_VERSION=57.5.0
HOME=/root
LANG=C.UTF-8
AWS_SECRET_ACCESS_KEY=
ONEVIEW_ENV=DEV
TERM=xterm
SHLVL=1
AWS_ACCESS_KEY_ID=
PYTHON_PIP_VERSION=23.0.1
PYTHON_GET_PIP_SHA256=96461deced5c2a487ddc65207ec5a9cffeca0d34e7af7ea1afc470ff0d746207
PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/0d8570dc44796f4369b652222cf176b3db6ac70e/public/get-pip.py
PATH=/root/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
AWS_SESSION_TOKEN=
_=/usr/bin/env
```

# TIL - Git: Understanding Git Log                                  - 09/Aug/23

1. commit object filename/hash `5a761fe` actually sits in `.git/objects/5a/761`
2. `index a871d21e..00000000` means `file hash before commit..file hash after commit`
    - `a871d21e` is the object representing the file, `000000` is no index /dev/null, this means deleting a file.
    - If it's new file it would be `00000000..a871d21e`
    - If it's change of some file contents, not new or delete, it would be `hash..hash` e.g. `abcs23rr..a871d21e`

```git
commit 5a761fe301ebfe45e0a72d99e619102cba149e6d (HEAD -> ON-1987-tiger-test-remove-aws-credentials, origin/ON-1987-tiger-test-remove-aws-credentials) 
Author: ynotstartups <ynotstartups@gmail.com>
Date:   Tue Aug 8 18:15:54 2023 +0100

    remove not needed configure_aws.sh

    The following environment variables are provided in github action
    aws-actions/configure-aws-credentials@v2 used in docker-compose-dev.yml

diff --git a/.github/configure_aws.sh b/.github/configure_aws.sh
deleted file mode 100644
index a871d21e..00000000
--- a/.github/configure_aws.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-set -eu
-
-export_aws_credentials () {
-   awsProfile=${AWS_PROFILE:-default}
-   AWS_ACCESS_KEY_ID=$(aws --profile "$awsProfile" configure get aws_access_key_id)
-   AWS_SECRET_ACCESS_KEY=$(aws --profile "$awsProfile" configure get aws_secret_access_key)
-   AWS_SESSION_TOKEN=$(aws --profile "$awsProfile" configure get aws_session_token)
-   export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
-
-}
-
-export_aws_credentials
```

# TIL - Bash: Resolve DNS ip addresses in Mac                       - 10/Aug/23

```bash
> dscacheutil -q host -a name google.com
name: google.com
ipv6_address: 2a00:1450:4009:820::200e

name: google.com
ip_address: 142.250.187.238
```

```bash
> nslookup google.com
Server:		fe80::1%15
Address:	fe80::1%15#53

Non-authoritative answer:
Name:	google.com
Address: 142.250.187.238
```

# TIL - Python: Get File Path To Python Source Codes                - 11/Aug/23

in iPython

```python
>>> import requests
>>> requests??
>>> import this
>>> this??
```

# TIL - Vim: Open Errors in Quickfix List For Vim                   - 17/Aug/23

1. in Vim, run command `:cexpr system('command that returns quickfix format')`
2. in Terminal, `vim -q <(command that returns quickfix error format)`

Example for quickfix format

```vim
./lambdas/atr_notification/__init__.py:1:1: F401 'json' imported but unused
./lambdas/atr_notification/__init__.py:2:1: F401 'boto3' imported but unused
./lambdas/atr_notification/__init__.py:4:1: F401 'lambdas.common.config.oneview.SNS_TARGET_ARN' imported but unused
```

Example quick hack of loading output into vim quickfix

```bash
alias ,a='docker compose run --rm serverless python -m mypy run.py lambdas/ tests/ > quickfix.vim ; cat quickfix.vim'
alias ,s='vim -q quickfix.vim'
```

# TIL - Vim: Terminal Color Scheme                                  - 25/Aug/23

I learn that I should enable my true color support which makes molokai color theme much better to see.

`set termguicolors`

**Useful links**

[Test your terminal color](https://github.com/termstandard/colors) 
[molokai color scheme](https://github.com/tomasr/molokai/blob/master/colors/molokai.vim)

# TIL - Docker: How does docker use cache?                          - 27/Aug/23

**Docker uses cache when the following two rules are met.**

1. when the docker command is not `ADD` or `COPY`, e.g. `RUN`
    a. given parent image in cache 
    b. look at next instruction
    c. if there is any child image (derived from parents) with the *exact same
    instruction use* it as cache
2. For `ADD` and `COPY` command, compare checksum of each file with exsiting
   images, if checksum is different then cache is invalidated

# TIL - Git: git checkout                                           - 27/Aug/23

Since git version 2.23.0, see [changelog](https://github.com/git/git/blob/master/Documentation/RelNotes/2.23.0.txt#L61-L65),
all functionalities of `git checkout` is replaced by
`git restore` and `git switch`, make `git checkout` obsolete.

> Two new commands "git switch" and "git restore" are introduced to
> split "checking out a branch to work on advancing its history" and
> "checking out paths out of the index and/or a tree-ish to work on
> advancing the current history" out of the single "git checkout"
> command.

for example,

`git checkout <commit>` is replaced by `git switch` for 

`git checkout [commit] <paths>` is replaced by `git restore`

# TIL - Git: git reset                                              - 27/Aug/23

> Reset, restore and revert
>    There are three commands with similar names: git reset, git restore and git revert.
>    •   git-revert(1) is about making a new commit that reverts the changes made by other commits.
>    •   git-restore(1) is about restoring files in the working tree from either the index or another commit. This command does not update your branch. The
>        command can also be used to restore files in the index from another commit.
>    •   git-reset(1) is about updating your branch, moving the tip in order to add or remove commits from the branch. This operation changes the commit
>        history.
>    git reset can also be used to restore the index, overlapping with git restore.

- `git reset --soft    <commit>` - changes HEAD to point to commit, put changes
  at index
- `git reset [--mixed] <commit>` - changes HEAD to point to commit, makes index
  look like HEAD
- `git reset --hard    <commit>` - changes HEAD to point to commit, discard
  changes in index and work directory

Conclusion, it's still too difficult to understand `git reset`, hmm, just stay away from `git reset`.

If I want to change branch, uses `git rebase` with fixup or squash.

# TIL - Vim: vim man page search for short option                   - 27/Aug/23

combine `/` `\C`  `\<`  `-g`  `\>`

- `\C` to turn on the case sensitivity case
- `\<` `\>` for word search
-  `\g` example for short option

# TIL - Vim: don't use vim to act as pager or man page reader       - 27/Aug/23

Vim doesn't interpret ansi sequences good enough, see the following photo.

![vim-man-page](images/vim-man-page.png)

# TIL - Python: python wheel                                        - 31/Aug/23

**output for installing source distribution (not wheel)**

downloading tar.gz and building wheel

```
> python -m pip install 'uwsgi==2.0.*'

Collecting uwsgi==2.0.*
  Downloading uwsgi-2.0.22.tar.gz (809 kB)
     ---------------------------------------- 809.7/809.7 kB 13.4 MB/s eta 0:00:00
  Preparing metadata (setup.py) ... done
Building wheels for collected packages: uwsgi
  Building wheel for uwsgi (setup.py) ... done
  Created wheel for uwsgi: filename=uWSGI-2.0.22-cp311-cp311-macosx_13_0_arm64.whl size=400536 sha256=a79b882b505a3093feed13f859dfa01e1ce04651abd125d418509505bc861d94
  Stored in directory: /Users/yuhao.huang/Library/Caches/pip/wheels/93/59/2d/d21852a9f9607e9494b5d3c96d11f348d11039f7c47223c9ce
Successfully built uwsgi
Installing collected packages: uwsgi
Successfully installed uwsgi-2.0.22
```

**output for installing wheel**

there’s no build stage when pip finds a compatible wheel on PyPI.

```
> python -m pip install 'chardet==3.*'
Collecting chardet==3.*
  Downloading chardet-3.0.4-py2.py3-none-any.whl (133 kB)
     ---------------------------------------- 133.4/133.4 kB 4.8 MB/s eta 0:00:00
Installing collected packages: chardet
Successfully installed chardet-3.0.4

```

A Python .whl file is essentially a ZIP (.zip) archive with a specially crafted
filename that tells installers what Python versions and platforms the wheel will
support.

`{dist}-{version}(-{build})?-{python}-{abi}-{platform}.whl`

`cryptography-2.9.2-cp35-abi3-macosx_10_9_x86_64.whl`

# TIL - Misc: ASCII encoding                                        - 02/Sep/23

**hexadecimal dump of ascii charaters**

from `man ascii`

The control characters in ASCII still in common use include:

- `0x00 (null, NUL, \0, ^@)`, originally intended to be an ignored character,
  but now used by many programming languages including C to mark the end of a
  string.
- `0x07 (bell, BEL, \a, ^G)`, which may cause the device to emit a warning such
  as a bell or beep sound or the screen flashing.
- `0x08 (backspace, BS, \b, ^H)`, may overprint the previous character.
- `0x09 (horizontal tab, HT, \t, ^I)`, moves the printing position right to the
  next tab stop.
- `0x0A (line feed, LF, \n, ^J)`, moves the print head down one line, or to the
  left edge and down. Used as the end of line marker in most UNIX systems and
  variants.
- `0x0B (vertical tab, VT, \v, ^K)`, vertical tabulation.
- `0x0C (form feed, FF, \f, ^L)`, to cause a printer to eject paper to the top
  of the next page, or a video terminal to clear the screen.
- `0x0D (carriage return, CR, \r, ^M)`, moves the printing position to the start
  of the line, allowing overprinting. Used as the end of line marker in Classic
  Mac OS, OS-9, FLEX (and variants). A CR+LF pair is used by CP/M-80 and its
  derivatives including DOS and Windows, and by Application Layer protocols such
  as FTP, SMTP, and HTTP.
- `0x1A (Control-Z, SUB, ^Z)`, Acts as an end-of-file for the Windows text-mode
  file i/o.
- `0x1B (escape, ESC, \e (GCC only), ^[)`. Introduces an escape sequence.

- Control characters may be described as doing something when the user inputs
  them, such as code 3 (End-of-Text character, ETX, ^C) to interrupt the running
  process, or code 4 (End-of-Transmission character, EOT, ^D), used to end text
  input on Unix or to exit a Unix shell. These uses usually have little to do
  with their use when they are in text being output.

**to see the hex value for characters**

`od -t a -t x1 -t c`

- `-t a`  - prints in ascii format
- `-t x1` - prints in hex format
- `-t c`  - prints in c escape format

e.g.

```
> printf '\0\a\b\n\r\t\v ' | od -t a -t x1 -t c
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
> echo "\e[31mRed Text\e[0m"
Red Text
```
- `\033[`  - Begin the color modifications
- `CODEm` - CODE + `m` at the end
- `\e[0m`  - End the color modifications

| code | description    |
|------|----------------|
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
> for i in {1..111}
do
    echo '\\e['$i'm' "\e[${i}mtext\e[0m"
done | column
```

![bash color](images/bash_color.png)

# TIL - Vim: gq formatoption                                        - 05/Sep/23

Current formatoption for markdown is `formatoption=jtln` from `set
formatoptions?`

							*fo-j*
j	Where it makes sense, remove a comment leader when joining lines.  For
	example, joining:
		int i;   // the index ~
		         // in the list ~
	Becomes:
		int i;   // the index in the list ~

							*fo-t*
t	Auto-wrap text using 'textwidth'

							*fo-l*
l	Long lines are not broken in insert mode: When a line was longer than
	'textwidth' when the insert command started, Vim does not
	automatically format it.

							*fo-n*
n	When formatting text, recognize numbered lists.  This actually uses
	the 'formatlistpat' option, thus any kind of list can be used.  The
	indent of the text after the number is used for the next line.  The
	default is to find a number, optionally followed by '.', ':', ')',
	']' or '}'.  Note that 'autoindent' must be set too.  Doesn't work
	well together with "2".
	Example: >
		1. the first item
		   wraps
		2. the second item

# TIL - Git: .. vs ...                                              - 05/Sep/23

## To see the code diff in `feature` branch?

```bash
git diff master...feature
```

## To see the commits added in `feature` branch?

```bash
git log master..feature
```

## Explanation for `git diff`

Use the three dots like this `git diff [<options>] <commit>...<commit>`.

```
  B---C---D master (Branch)
 /
A
 \
  H---I feature (Branch)
```

Two dots - show the diffs between all changes on both sides,
use the `git diff master..feature`,
output: (diff of `H, I` against `B, C, D`)

Three dots - to show the diffs between the last common ancestor (A), aka the
commit we started the feature branch,
use `git diff master...feature`,
output: (diff of `H, I` against `A`).

## Note that ... and .. don't have the same meaning in git log

> However, "diff" is about comparing two endpoints, not ranges, and the range
> notations ("<commit>..<commit>" and "<commit>...<commit>") do not mean a range
> as defined in the "SPECIFYING RANGES" section in gitrevisions[7].
>
from `git diff --help`

## Explanation for `git log`

Kind of like reversing the meaning for `...` and `..` in `git diff`


```bash
git log master..feature

# equivalent to

git log ^master feature

# refers to commit `H and I`
```

```bash
git log master...feature

# equivalent to

git log master feature --not $(git merge-base --all master feature)

# refers to commit `B, C,D, H and I`
```

See `man gitrevision` under `SPECIFYING RANGES` section

## See also

The **best stack overflow** explanation [see here](https://stackoverflow.com/a/7256391)

# TIL - Misc: Thoughts On Shortcuts                                 - 06/Sep/23

It's not about the most efficient / least keystockes, it's more about making
them suit my own personal way of working.

# TIL - Vim: Tips about Fugitive                                    - 06/Sep/23

- `:Gedit Head~3:%` to load the current file in buffer 3 commits ago, like `git
  restore --source=HEAD~3` current filename
- `:Gvdiffsplit origin/master:%` to see git diff with file in origin/master
    - and `<ctrl-l>` to switch

# TIL - Vim: Some links about mapping                               - 06/Sep/23

- `:verbose nmap ]]` - to find out which file that mapping is defined in. From
  there you should be able to figure out which plugin that file is a part of

Useful resources on how to do mappings below

https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)

https://learnvimscriptthehardway.stevelosh.com/chapters/30.html

# TIL - Vim: Find out vim's python                                  - 10/Sep/23

- `:py3 import os;print(os.__file__)` - print path of python
    - /opt/homebrew/Cellar/python@3.11/3.11.4_1/Frameworks/Python.framework/Versions/3.11/lib/python3.11/os.py
    - using the system python at the n fmoment

# TIL - Vim: Matches on the second occurrence                       - 17/Sep/23

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
something like delete the second `<>`

# TIL - Bash: Change date format in bash                            - 17/Sep/23

TLDR - `date -j -f '%d/%b/%y' $INPUT_DATE +%Y-%m-%d`

- `-f` takes `strftime` format string, `man strftime`
    - turns out python `datetime.strftime` also uses the exact same format
      string, because python internally uses standard c library's `strftime`
- `+%Y-%m-%d` is the output format
- `-j` do not try to set the date, this allows the usage of `-f` and `+` to
  convert one date format to another

# TIL - Vim: How to print manual page in color                      - 17/Sep/23

1. Use `Vim` with `:Man`, you will need `runtime ftplugin/man.vim`
2. open man page with `:Man date`
3. In zshrc `export MANWIDTH=80`, this sets the width to 80 so that the man
   page can fit in one page with correct paragraph indent
4. `:TOhtml` (P.S. I have my own `:TOPrintHtml`)
5. then open with web browser and print

# TIL - Python: Get celery ran tasks                                - 27/Sep/23

```python
from django_celery_results.models import TaskResult
from pprint import pprint

# get tasks by recency
task_result = TaskResult.objects.order_by('-date_created')[:5]
for i in task_result:
    pprint(vars(i))

# get failed tasks
task_result = TaskResult.objects.filter(status='FAILURE').order_by('date_done')[:10]
for i in task_result:
    pprint(vars(i))

```

# TIL - Bash: Man Page v.s. Books                                   - 29/Sep/23

Manual page, such as `man awk`, is a good reference manual, but reading it is
not a good way of learning, to learn, a beginner book from O'Reilly is much
better.

# TIL - Bash: CUPS and Epson ET-2810 Printer                        - 30/Sep/23

TL;DR: `lpr -p -o EPIJ_Silt=1 -o Resolution=720x720dpi -o EPIJ_Qual=307 ./lpoptoins.pdf`

Use `lpoptions -l` to show custom options for printer, such as `EPIJ_Qual/Print
Quality: 308 311 *303 309 304 305 306 307`.

Note that only `EPIJ_Qual` is used in printing option e.g. `lpr -o
EPIJ_Qual=308`, the text after `/` is an short description of the option.

Example output of `lpoptions -l`

```
$ lpoptions -l
...
EPIJ_Ink_/Grayscale: *1 0
EPIJ_Qual/Print Quality: 308 311 *303 309 304 305 306 307
ColorModel/ColorModel: *RGB Mono
Resolution/Resolution: 180x180dpi *360x360dpi 720x720dpi
PageSize/Media Size: *A4 EPKG EPKG.NMgn EPPhotoPaper2L A6 A5 B5 B6 EPPhotoPaperLRoll EPPhotoPaperLRoll.NMgn EPIndexCard5x8 EP8x10in EPHiVision102x180 EPHiVision102x180.NMgn EPPostcard100x148 EPPostcard100x148.NMgn Env10 EnvDL EnvC6 Letter EP216x330mm EPIndianLegal Legal EP16K195x270mm Custom.WIDTHxHEIGHT
EPIJ_Silt/Quiet Mode: *0 1
...
```

upzip `/Library/Printers/PPDs/Contents/Resources/EPSON\ ET-2810\ Series.gz` to
`~/Documents/downloads/` read the mearning of options.

Run the following command in the unzipped `downloads` folder
```
$ cat EPSON\ ET-2820\ Series | grep Qua
...
*EPIJ_Qual 308/Draft: ""
*EPIJ_Qual 311/Draft-Vivid : ""
*EPIJ_Qual 303/Normal: ""
*EPIJ_Qual 309/Normal-Vivid: ""
*EPIJ_Qual 304/Fine: ""
*EPIJ_Qual 305/Quality: ""
*EPIJ_Qual 306/High Quality: ""
*EPIJ_Qual 307/Best Quality: ""
...
```

Other Useful Links: 

- local Cups link: http://localhost:631/
    - logins with laptops's username and password
- `/private/etc/cups/ppd`
    - printer ppd file - Postscript Printer Description file is a file that describes the font s, paper sizes, resolution , and other capabilities that are standard for a particular Postscript printer

# TIL - Bash: Search source code in certain directories only        - 01/Oct/23

Question: How to exclude *.tsx, migrations files, and python tests files?

## In git grep

```bash
git grep 'tiger' -- '*.py' ':!*tests*' ':!*migrations*'
# same as 
git grep 'tiger' -- '*.py' ':(exclude)*tests*' ':(exclude)*migrations*'
```

After the `--` the patterns used are `<pathspec>`, see `man gitglossary`.

## In Rg

```bash
rg 'tiger' --glob '!{**/tests/*,**/migrations/*}'

# if you are sure there are no files with name `tests` or `migations`, you
# can do
rg 'tiger' --glob '!{tests,migrations}'

rg 'tiger' -g '!tests' -g '!migrations'
```

# TIL - Bash: Shell builtin commands and Busybox                    - 01/Oct/23

Certain shell commands are builtin to `zsh`, others are exposed in PATH.
`echo` is a shell built-in command
`cat` is exposed in PATH.

```bash
$ which echo
echo: shell built-in command

$ which cat
/bin/cat
```

## What is BusyBox?

>BusyBox combines tiny versions of many common UNIX utilities into a single
>small executable.  It provides minimalist replacements for most of the
>utilities you usually find in bzip2, coreutils, dhcp, diffutils, e2fsprogs,
>file, findutils, gawk, grep, inetutils, less, modutils, net-tools, procps,
>sed, shadow, sysklogd, sysvinit, tar, util-linux, and vim.  The utilities
>in BusyBox often have fewer options than their full-featured cousins;
>however, the options that are included provide the expected functionality
>and behave very much like their larger counterparts.

BusyBox seems useful to

1. read the C Implementation of the shell utilities
1. use as sandbox as a simpler environment compared in MacOS

## Implementation of shell command `cat` in `C`

https://github.com/mirror/busybox/blob/master/coreutils/cat.c

## Play with busybox

`docker run -it --rm busybox`

```
/bin # ls -l | wc -l
406
```

There are 406 utilities in busybox /bin, whereas MacOS has 980 in `/usr/bin`.

# TIL - Bash: bash find out the size of current directory           - 03/Oct/23

`du -d 1 -h | sort --human-numeric-sort --reverse | head`

worth noting that

- sort has this option `--human-numeric-sort` specifically for human output
  i.e. `du -h`

# TIL - Misc: Authentication vs Authorization                       - 05/Oct/23

Authentication is the process of verifying that "you are who you say you are"

Authorization is the process of verifying that "you are permitted to do what
you are trying to do"

# TIL - Vim: Vim Extract Table of Content                           - 07/Oct/23

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

# TIL - Python: Find the dependencies of python package             - 19/Oct/23

Two ways

1. Go into a shell with the dependencies installed

```python
In [1]:  from importlib.metadata import requires

In [2]: requires('Django')
Out[2]:
['asgiref (<4,>=3.3.2)',
 'pytz',
 'sqlparse (>=0.2.2)',
 "argon2-cffi (>=19.1.0) ; extra == 'argon2'",
 "bcrypt ; extra == 'bcrypt'"]
 ```

 2. Read the poetry.lock file 

```
[[package]]
name = "django"
version = "3.2.20"
description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design."
optional = false
python-versions = ">=3.6"
files = [
    {file = "Django-3.2.20-py3-none-any.whl", hash = "sha256:a477ab326ae7d8807dc25c186b951ab8c7648a3a23f9497763c37307a2b5ef87"},
    {file = "Django-3.2.20.tar.gz", hash = "sha256:dec2a116787b8e14962014bf78e120bba454135108e1af9e9b91ade7b2964c40"},
]

[package.dependencies]
asgiref = ">=3.3.2,<4"
pytz = "*"
sqlparse = ">=0.2.2"

[package.extras]
argon2 = ["argon2-cffi (>=19.1.0)"]
bcrypt = ["bcrypt"]
```

# TIL - Docker: 137 exit code                                       - 16/Aug/23

TLDR: Exit code 137 is caused by `oneview-django-1` container exited

1. mostly likely caused by migration file in the PR conflicting with migration
   files in master branch.
2. if there is no migration, it could be some other error causing
   `oneview-django-1` exits,
   such as `TypeError: check_permissions() got an  unexpected keyword argument 'groups'`

<img width="388" alt="Screenshot 2023-08-16 at 18 26 41" src="https://github.com/Saltus-Partners/oneview/assets/13963732/7e36c2b5-5782-4eb8-9ee2-c147c489cb61">

**First of all, Exit code 137 doesn't necessarily mean out of memory issue.**

Based on [Advanced Bash-Scripting Guide Exit Code](https://tldp.org/LDP/abs/html/exitcodes.html), in the example of 128 + n , 137 exit code means a process receives Fatal Error Signal 9, i.e. `kill -9`, from `man kill`, kill with signal 9 is `KILL (non-catchable, non-ignorable kill)`.

**The actual reason of exit code 137**

This PR, contains the minimal changes to demonstrate/reproduce the exit code 137, the changes are
1. added migration file
2. in github action, use `sleep 999`  to replace other actions such as install dev dependencies, lint, tests ...

In the github action, we use [actions/checkout@v3](https://github.com/actions/checkout), which under the hood, checkout a **merge** PR with `origin/master` branch.

In this PR, we have a migration file `0185_task_retain_regarding.py`, and in master branch we have additional migration files `0185_auto_20230814_1357.py` and `0186_providercontact_status.py`, because github action checkout creates the merge PR, then in the github action running environment, we have all three of these migration files. 

Because of these conflicting migrations files, the `oneview-django-1` container constantly exits with error `CommandError: Conflicting migrations detected; multiple leaf nodes in the migration graph: (0185_task_retain_regarding, 0186_providercontact_status in oneview).` 

<img width="1530" alt="Screenshot 2023-08-16 at 18 20 21" src="https://github.com/Saltus-Partners/oneview/assets/13963732/3e448c9e-dfe0-4cfe-8fb9-6129fce8d859">

Then in the bash sleep step `docker compose --file docker-compose-dev.yml exec django sleep 999`,
the `/bin/sleep` is running within the container, but the container gets killed, then this sleep process exited with 137.

To confirm the above finding is correct, I managed to reproduce the exit code 137 locally. 
To reproduce,  you can run `make run-be` in the first terminal window, and run `make bash` in the second terminal window, then you quick input 3 <ctrl-c> in the first terminal to force kill the oneview-django-1 container, the container will get a `SIGKILL` i.e. `kill -9` that's why the process exited with exit code 137.

<img width="733" alt="Screenshot 2023-08-16 at 18 14 50" src="https://github.com/Saltus-Partners/oneview/assets/13963732/edf8bb12-3814-4066-bbb5-d1dc8b84561c">

**Bonus Issues While investigating**

the celery container is constantly exiting too... something we might need to fix in the future, though our tests don't rely on celery 

<img width="819" alt="Screenshot 2023-08-16 at 18 20 46" src="https://github.com/Saltus-Partners/oneview/assets/13963732/50dec62f-5b5d-469d-a532-c5676f627f03">

# TIL - Saltus: How does tech project get prioritised in Saltus?    - 31/Aug/23

Tech-co holds a bi-monthly meeting to talk about all projects and Ashley acts as
a referer to prioritise the projects.

Few criterias are considered for priortisation.

- how easy to do, whether it helps lot of people
- compliance
- cash
- efficiency

Epic becomes important to align with tech-co project.

Creations of dev tickets

1. Post Implementation Checks
2. Tech-co meetting (bi-monthly)
3. Developers Architecting and Spikings 
3. Jira Tickets

# TIL - Saltus: What are the responsibilities of BA in Saltus?      - 31/Aug/23

- define businesse objectives and problem statements
  by working interatively with devs
- (optionally) work with devs on tech architecture
- help with kanban
- QA testing the final tech product

# TIL - Python: fileobj vs string vs byte string                    - 23/Jan/24

- string - 'abc' - a sequence of Unicode characters
- byte string - b'abc' - a sequence of octets (integers between 0 and 255)
- fileobj - BytesIO('abc') or BytesIO(b'abc') - an file like object that
  implements `.read()`

# TIL - Python: Profiling in iPython                                - 06/May/24

## ``%%prun -r` returns profiling object

```python
%%prun -D stats

from oneview.models.helpers.imports import pull_accounts_no_threaded
pull_accounts_no_threaded()
```

```python
import pstats
from pstats import SortKey

stats = pstats.Stats('stats')

# `tottime` for the total time spent in the given function (and excluding time
# made in calls to sub-functions)
stats.sort_stats('tottime').print_stats(50)
stats.sort_stats('cumtime').print_stats(50)
stats.sort_stats('filename').print_stats(50)
```

## Alternatively, Just timeit once 

```
%%timeit -n 1 -r 1

from oneview.models.helpers.imports import pull_accounts, pull_accounts_no_threaded
pull_accounts()
```

See also
- [pstat sort keys](https://docs.python.org/3/library/profile.html#pstats.Stats.sort_stats)
- [%prun documentation](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-prun)
- [%timeit documentation](https://ipython.readthedocs.io/en/stable/interactive/magics.html#magic-timeit)

# TIL - Fish: right Alt-v to open vim to edit command line          - 09/May/24

Notes for the future:

to have `alt-v` works I need to set the right `alt` key to be `Esc+` in iTerm2

> Q: How do I make the option/alt key act like Meta or send escape codes?
> A: Go to Preferences > Profiles tab. Select your profile on the left, and then
> open the Keyboard tab. At the bottom is a set of buttons that lets you select
> the behavior of the Option key. For most users, Esc+ will be the best choice.

from https://iterm2.com/faq.html

# TIL - Django: inheritance..                                       - 14/May/24

Django likes subclassing existing class.

RelatedManager subclasses Manager to get all method from managers.

>    Create a manager for the reverse side of a many-to-one relation.
>
>    This manager subclasses another manager, generally the default manager of
>    the related model, and adds behaviors specific to many-to-one relations.

https://github.com/django/django/blob/a09082a9bec18f8e3ee8c10d473013ec67ffe93b/django/db/models/fields/related_descriptors.py#L675C5-L675C45

Manager is a subclass of QuerySet so that manager has all the methods of
QuerySet.

> class Manager(BaseManager.from_queryset(QuerySet)):
>    pass

https://github.com/django/django/blob/f030236a86a64a4befd3cc8093e2bbeceef52a31/django/db/models/manager.py#L176


# TIL - vim: experimenting python vim module                        - 03/Jun/24

Quickly 

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
# TIL - Python: requests library possible errors                    - 06/Jun/24

| error type                 | safe to retry | examples of when error occurs                                         |
|----------------------------|---------------|-----------------------------------------------------------------------|
| HTTPError - 4xx            | No            | client error, e.g., calling the api incorrectly                       |
| HTTPError - 5xx            | No            | server error, e.g. bugs in server code                                |
| Connection Error           | Maybe         | incorrect configurations or unavailble network                        |
| Connection Timeout         | Yes           | network congestion, server too busy to responds, server being offline |
| Request Timeout            | Maybe         | ??                                                                    |
| Requests library Exception | No            | data passed in cannot be converted to json                            |
| Other Python Exception     | No            | any python errors                                                     |

Note that Request Timeout means _The server did not send any data in the
allotted amount of time_ in `Requests` library.

https://requests.readthedocs.io/en/latest/api/#requests.ReadTimeout

## See also

https://requests.readthedocs.io/en/latest/api/#exceptions


# TIL - Python: search in a python function                         - 21/Jun/24

generalised to search within visual selected region

1. visual select a function `vaf`
1. **exit** the visual mode
1. `/\%Vfoo` to seach in the last visual region (see `:help /\%V`)

# TIL - Python: run black or flake8 on python code in markdown      - 21/Jun/24

generalised to any files

1. `vic` visual select lines of python codes in markdown code block
1. `:'<,'>!black -q -` to replace the visually selected lines with the formatted
   standard output of the external `black` command (see `:help filter`)
1. `:'<,'>w !flake8 -` to use `w` to echo flake8's output instead of replacing
   visually selected lines (see `:help :w_c`)

**Alternatively, I can open the output in a split**

1. `:'<,'>w !flake8 - > quickfix.vim` to pipe the output into `quickfix.vim`
2. `<leader>el` 

# TIL - Vim: Registers & Macros                                     - 21/Jun/24

- `"kp` - paste from register k
- `"Kyy` - append to register k by using capital register letter `K`
- `"0p` - paste from last yanked test

- `qk` - start to record macro in register `k`
- `[count]@k` - apply macro in register `k`, [count] number of times
- `@@` - apply last macro

# TIL - Vim: apply changes to lines match a pattern                 - 21/Jun/24

- `:g/foo/d` - delete lines with pattern foo in this file, `d` is the
  abbreviation of `:delete` command
- `:g/foo/normal Q` - apply macro on lines with pattern foo in this file

# TIL - Vim: vim.eval in python vim                                 - 21/Jun/24

```python
def get_import_path_given_word(vim: object) -> str | None:
    word = vim.eval('expand("<cword>")')

    for package, words in package_and_word.items():
        if word in words:
            import_string = f"from {package} import {word}"
            print(import_string)
            return import_string

```

This function above is used in `vim_python.py` imported into vim.

The `vim.eval` literally runs the string passed in as vim code and export the
vim object into python object

For example, the following two vim commands are equivalent.

```
:py3 print(vim.eval('expand("<cword>")'))
:echom expand("<cword>")
```
See also `:help if_pyth.txt`
# TIL - Vim: regex look ahead / behind                              - 27/Jun/24


## Find expression A where expression B follows

`\@=` e.g. `\A\(B\)\@=`

might be easier to use `\ze`

## Find expression A where expression B does not follow

`\@!` e.g. `A\(B\)\@!`

## Find expression A where expression B is behind:

`\@<=` e.g. `\(B\)\@<=A`

might be easier to use `\zs`

## Find expression A where expression B is not behind:

`\@<!` e.g. `\(B\)\@<!A`

## For example

"""
foo(
def foo(
"""

to match only function definitions, e.g. the `foo` after def

`\(def[ ]\)\@<=foo(`

to match function usage e.g. the `foo` not after `def`

`\(def[ ]\)\@<!foo(`

"""
foobar
foobaz
"""

`foo\(bar\)\@=` - matches foo that follows with bar e.g. matches first
`foo\(bar\)\@!` - matches foo that not follows with bar e.g. matches second

# TIL - Oneview: GraphIQL + Django Debug Tool Bar                   - 28/Jun/24

1. login to `http://localhost:8000/admin/`
2. go to `http://localhost:8000/graphql/`
3. copy paste both the graphql query and graphql variable from the graphql
   request plugin
4. run the added query in graphiql
5. look at the django debug toolbar

# TIL - Git Rebase                                                  - 09/Sep/24

- `git rebase -X ours -i origin/development`
    - on merge conflicts, use origin/development
- `git rebase -X theirs -i origin/development`
    - on merge conflicts, use my branch


# TIL - quick start guide for pdb debugging                         - 20/Sep/24

## Debugging after ssh into uat

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

## pdb

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
