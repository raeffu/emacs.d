((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat")
  ("--no-ext-diff")
  ("--diff-algorithm=default" "--no-ext-diff" "--stat")
  (("--" "server/Gemfile"))
  (("--" "app/assets/stylesheets/structure/_progress.sass")))
 (magit-diff:--diff-algorithm)
 (magit-dispatch nil)
 (magit-fetch nil
              ("--tags"))
 (magit-log
  ("-n256" "--graph" "--color" "--decorate")
  ("-n256" "--graph" "--decorate"))
 (magit-pull
  ("--rebase")
  nil)
 (magit-push
  ("--force-with-lease")
  nil)
 (magit-rebase
  ("--interactive")
  nil)
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-revert
  ("--edit"))
 (magit-stash
  ("--include-untracked")
  nil)
 (magit-tag
  ("--annotate")))
