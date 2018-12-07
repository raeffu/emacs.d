;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'bind-key)

(global-unset-key (kbd "C-x C-x")) ; unbind shit that stops me from saving
(global-unset-key (kbd "C-b")) ; backward-char
(global-unset-key (kbd "C-f")) ; forward-char
(global-unset-key (kbd "C-p")) ; previous-line
(global-unset-key (kbd "C-n")) ; next-line
(global-unset-key (kbd "C-M-i"))
(global-set-key (kbd "M-j") 'backward-char)
(global-unset-key (kbd "M-l"))
(global-set-key (kbd "M-l") 'forward-char)
(global-unset-key (kbd "M-i")) ; helm-multi-swoop-all-from-helm-swoop
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-I") 'scroll-down)
(bind-keys*
 ("M-C-S-i" . scroll-other-window-down)
 ("M-C-S-k" . scroll-other-window))
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-K") 'scroll-up)
(global-set-key (kbd "M-L") 'end-of-line)
(global-set-key (kbd "M-J") 'beginning-of-line)

(global-unset-key (kbd "M-b")) ; backward-word
(global-unset-key (kbd "M-f")) ; forward-word
(bind-keys*
 ("M-C-n" . forward-list)
 ("M-u" . backward-word)
 ("M-o" . forward-word)
 ("M-U" . backward-paragraph)
 ("M-O" . forward-paragraph)
 ("M-C-o" . forward-sexp)
 ("M-C-u" . backward-sexp)
 ("M-b" . pop-to-mark-command)
 )
;; (global-set-key (kbd "M-u") 'backward-word)
;; (global-set-key (kbd "M-o") 'forward-word)
;; (global-set-key (kbd "M-U") 'backward-paragraph)
;; (global-set-key (kbd "M-O") 'forward-paragraph)
;; (global-set-key (kbd "M-C-o") 'forward-sexp)
;; (global-set-key (kbd "M-C-u") 'backward-sexp)
;; (global-set-key (kbd "M-b") 'pop-to-mark-command)

(global-unset-key (kbd "C-<backspace>")) ; backward-kill-word
(global-unset-key (kbd "M-d")) ; kill-word

(global-unset-key (kbd "C-d")) ; delete-char
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "M-F") 'kill-word)
(global-set-key (kbd "<delete>") 'delete-char)

(global-unset-key (kbd "M-<")) ; beginning-of-buffer
(global-unset-key (kbd "M->")) ; end-of-buffer
(global-unset-key (kbd "M-h"))
(global-unset-key (kbd "M-H"))
(global-set-key (kbd "M-h") 'beginning-of-buffer)
(global-set-key (kbd "M-H") 'end-of-buffer)

(global-unset-key (kbd "C-x 1")) ; delete-other-windows
(global-unset-key (kbd "C-x 0")) ; delete-window
(global-unset-key (kbd "M-8")) ; digit-argument
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-4") 'balance-windows)
(global-set-key (kbd "M-9") 'delete-other-windows)
(global-set-key (kbd "M-8") 'delete-other-windows-vertically)
(global-set-key (kbd "M-+") 'balance-windows)

;; Zoom-Window
(global-set-key (kbd "M-1") 'zoom-window-zoom)

(global-unset-key (kbd "M-x")) ; execute-extended-command
(global-set-key (kbd "M-q") 'eshell)

(global-unset-key (kbd "C-d"))
(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-a"))
(bind-keys*
 ("C-d" . windmove-right)
 ("C-s" . windmove-down)
 ("C-a" . windmove-left)
 ("C-w" . windmove-up))

(global-unset-key (kbd "C-/")) ; undo
(global-unset-key (kbd "C-_")) ; undo
(global-set-key (kbd "M-z") 'undo)

(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-unset-key (kbd "M-w")) ; kill-ring-save
(global-unset-key (kbd "C-y")) ; yank
(global-unset-key (kbd "M-y")) ; yank-pop
(global-unset-key (kbd "C-r")) ; yank-pop
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(bind-keys*
 ("M-v" . yank))
(global-set-key (kbd "M-V") 'yank-pop)
(global-set-key (kbd "C-r d") 'kill-rectangle)

(global-unset-key (kbd "C-x C-f")) ; find-file
(global-unset-key (kbd "C-x h")) ; mark-whole-buffer
(global-unset-key (kbd "C-x C-w")) ; write-file

;; general
(global-set-key (kbd "M-r") 'replace-string)
(global-set-key (kbd "C-c i") 't-indent-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c k") 'kill-compilation)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

(global-unset-key (kbd "C-M-r")) ;; isearch-backwards
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-*") 'isearch-forward-at-point)
(global-set-key (kbd "C-q") 'quoted-insert)

(global-set-key (kbd "C-c r") 'revert-buffer)

(define-key isearch-mode-map (kbd "M-v") 'isearch-yank-kill)
(define-key isearch-mode-map (kbd "M-w") 'isearch-query-replace)
(define-key isearch-mode-map (kbd "M-o") 'isearch-yank-word)
(define-key isearch-mode-map (kbd "M-l") 'isearch-yank-char)
(define-key isearch-mode-map (kbd "M-j") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "M-u") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)

;; power-edit bundle bindings
(global-set-key (kbd "C-c u") 't-move-text-up)
(global-set-key (kbd "C-c n") 't-move-text-down)
(global-set-key (kbd "C-M-l")  'textmate-shift-right)
(global-set-key (kbd "C-M-j")  'textmate-shift-left)
(global-set-key (kbd "C-c C-w") 'whitespace-mode)

(global-unset-key (kbd "M-t"))
(global-set-key (kbd "M-t") 'projectile-find-file)

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x M-r") 'ruby-compilation-this-buffer)
(global-set-key (kbd "C-x M-k") 'kill-this-buffer)
(global-set-key (kbd "C-x t") 'dired-other-window)
(global-set-key (kbd "M-RET") 't-newline-and-indent)
(global-set-key (kbd "C-c C-c") 't-duplicate-current-line-or-region)

;; Help

(defvar lisp-find-map)
(define-prefix-command 'lisp-find-map)

(global-set-key (kbd "C-h e") 'lisp-find-map)

(global-set-key (kbd "C-h e c") 'finder-commentary)
(global-set-key (kbd "C-h e e") 'view-echo-area-messages)
(global-set-key (kbd "C-h e f") 'find-function)
(global-set-key (kbd "C-h e v") 'find-variable)
(global-set-key (kbd "C-h e F") 'find-face-definition)
(global-set-key (kbd "C-h e i") 'info-apropos)
(global-set-key (kbd "C-h e k") 'find-function-on-key)
(global-set-key (kbd "C-h e l") 'find-library)

(defvar lisp-eval-map)
(define-prefix-command 'lisp-eval-map)

(global-set-key (kbd "C-c e") 'lisp-eval-map)

(global-set-key (kbd "C-c e b") 'eval-buffer)
(global-set-key (kbd "C-c e r") 'eval-region)
(global-set-key (kbd "C-c e l") 'eval-last-sexp)

(global-set-key (kbd "C-x p") 't-project-ido-find-project)
(global-set-key (kbd "C-c C-k") 't-comment-or-uncomment-region-or-line)

;; Perspective

(global-set-key (kbd "C-p s") 'persp-switch)
(global-set-key (kbd "C-p p") 't-persp-last)
(global-set-key (kbd "C-p e") 't-emacs-conf-persp)
(global-set-key (kbd "C-p o") 't-org-persp)
(global-set-key (kbd "C-p d") 'persp-kill)
(global-set-key (kbd "C-p x") 'persp-kill)
(global-set-key (kbd "C-_") 'company-complete)

(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-q") 't-shell-command)
(global-set-key (kbd "C-c M-d") 't-delete-current-buffer-file)

;; Traverse through buffers
(global-set-key (kbd "M->") 'next-buffer)
(global-set-key (kbd "M-<") 'previous-buffer)

;; Rectangle bindings

(global-set-key (kbd "C-x r M-i") 'string-insert-rectangle)

;; Test bindings

(defvar testing-map)
(define-prefix-command 'testing-map)

(global-unset-key (kbd "M-e"))
(global-set-key (kbd "M-e") 'testing-map)

(global-set-key (kbd "M-e e") 'tester-run-test-file)
(global-set-key (kbd "M-e s") 'tester-run-test-suite)

;; Helm
(bind-keys*
 ("M-a" . helm-M-x))
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-R") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)
(global-set-key (kbd "C-h C-b") 'helm-descbinds)
(global-set-key (kbd "M-w") 'helm-imenu)
(global-set-key (kbd "C-o") 'helm-find-files)
;; (global-set-key (kbd "M-g a") 'helm-projectile-ag)
(global-set-key (kbd "M-g a") 'ag)
;;(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key process-menu-mode-map (kbd "C-k") 't-delete-process-at-point)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "C-x M-l") 'magit-log)
(global-set-key (kbd "C-x M-b") 'magit-blame)

;; tmux
;; (global-unset-key (kbd "C-q")) ; quoted-insert

;; swap `transpose-chars' key with `transpose-lines'
(global-set-key "\C-t" #'transpose-lines)
(define-key ctl-x-map "\C-t" #'transpose-chars)

(provide 'raeffu-keybindings)
;;; raeffu-keybindings.el ends here
