((magit-log:magit-log-mode "-n256" "--graph" "--color" "--decorate")
 (magit-pull "--rebase")
 (magit-rebase "--interactive")
 (magit-stash "--include-untracked"))
