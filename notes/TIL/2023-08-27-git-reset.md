# TIL - git reset                                                    - 27/Aug/23

> Reset, restore and revert
> There are three commands with similar names: git reset, git restore and git revert.
> •   git-revert(1) is about making a new commit that reverts the changes made by other commits.
> •   git-restore(1) is about restoring files in the working tree from either the index or another commit. This command does not update your branch. The
> command can also be used to restore files in the index from another commit.
> •   git-reset(1) is about updating your branch, moving the tip in order to add or remove commits from the branch. This operation changes the commit
> history.
> git reset can also be used to restore the index, overlapping with git restore.

- `git reset --soft    <commit>` - changes HEAD to point to commit, put changes
  at index
- `git reset [--mixed] <commit>` - changes HEAD to point to commit, makes index
  look like HEAD
- `git reset --hard    <commit>` - changes HEAD to point to commit, discard
  changes in index and work directory

Conclusion, it's still too difficult to understand `git reset`, hmm, just stay away from `git reset`.

If I want to change branch, uses `git rebase` with fixup or squash.
