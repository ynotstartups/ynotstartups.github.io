# TIL - git checkout                                                 - 27/Aug/23

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
