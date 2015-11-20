;;; init.el --- Personal emacs configuration of Samuel Tonini

;;; Commentary:
;;
;;(setq mac-option-key-is-meta nil)
;;(setq mac-command-key-is-meta t)
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier nil)

;;; Code:

(setq package-enable-at-startup nil)
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path (expand-file-name "parts" user-emacs-directory))

(require 'smartparens-prt)
(require 'magit-prt)
(require 'programming-prt)
(require 'project-prt)
(require 'completion-prt)
(require 'system-prt)
(require 'display-prt)
(require 'ruby-prt)
;;(require 'elixir-prt)
;;(require 'emacs-lisp-prt)
(require 'js-prt)
(require 'coffee-prt)
(require 'yasnippet-prt)
;; (require 'which-key-prt)
(require 'utils-prt)
(require 'writer-prt)
(require 'custom-prt)
(require 'org-prt)
(require 'dired-prt)
(require 'grep-prt)
(require 'ace-prt)
(require 'keybindings-prt)
(require 'helm-prt)
(require 'html-prt)

(provide 'init)

;;; init.el ends here
