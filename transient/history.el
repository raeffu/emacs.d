((magit-blame
  ("-w"))
 (magit-branch nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat")
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
 (magit-merge nil)
 (magit-pull
  ("--rebase")
  nil)
 (magit-push nil
             ("--force-with-lease")
             ("--force"))
 (magit-rebase
  ("--interactive")
  nil)
 (magit-remote
  ("-f"))
 (magit-reset nil)
 (magit-revert
  ("--edit")
  nil)
 (magit-stash
  ("--include-untracked")
  nil)
 (magit-tag nil))
