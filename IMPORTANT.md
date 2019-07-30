The whole point of this repository is that there should ever be one commit in
the git history, otherwise the size would explode.

The CI scripts preserve this property.

If you need to edit this repository manually, always do: `git commit --amend`.

If you need to fix the repository:

```bash
git checkout --orphan -b tmp
git status # everything should be green
git commit -m "Single commit"
git checkout master
git reset --hard tmp
git push -f
```
