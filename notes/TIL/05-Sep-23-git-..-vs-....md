# TIL - git .. vs ...                                                - 05/Sep/23

TLDR: to see what is new in master but not in prod branch? use the following

```
git diff origin/env/prod...origin/master --stat
git log  origin/env/prod...origin/master --stat
```

Note this is not the same as `git diff origin/master...origin/env/prod --stat`!

Use the three dots like this `git diff before...after`.

```
  B---C---D origin/master (Branch)
 /
A
 \
  H---I origin/feature (Branch)
```

Two dots - show the diffs between all changes on both sides,
use the `git diff origin/master..origin/feature`,
output: ( H, I against B, C, D )

Three dots - to show the diffs between the last common ancestor (A), aka the
commit we started the feature branch,
use `git diff origin/master...origin/feature`,
output: (H, I against A).

**What about git log?**

> However, "diff" is about comparing two endpoints, not ranges, and the range
> notations ("<commit>..<commit>" and "<commit>...<commit>") do not mean a range
> as defined in the "SPECIFYING RANGES" section in gitrevisions\[7\].

The **best stack overflow** explanation [see here](https://stackoverflow.com/a/7256391)
