;;; init.el --- Personal emacs configuration of Raphael Laubscher

;; Copyright © 2016 Raphael Laubscher
;;
;; Author: Raphael Laubscher <raeffu@raeffu.me>
;; Maintainer: Raphael Laubscher <raeffu@raeffu.me>
;; URL: http://www.github.com/raeffu/emacs.d

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Personal Emacs configuration of Raphael Laubscher

;;; Code:

;;; Debugging
(setq message-log-max 10000)

;; Please don't load outdated byte code
(setq load-prefer-newer t)

;; Bootstrap `use-package'
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;(require 'diminish)
(require 'bind-key)

;; Customization
(defconst raeffu-custom-file (locate-user-emacs-file "customize.el")
  "File used to store settings from Customization UI.")

(setq temporary-file-directory (expand-file-name "~/.emacs.d/tmp"))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'raeffu-utils)
;;(require 'raeffu-functions)
(require 'raeffu-keybindings)

(defun split-window-sensibly-prefer-horizontal (&optional window)
"Based on split-window-sensibly, but designed to prefer a horizontal split,
i.e. windows tiled side-by-side."
  (let ((window (or window (selected-window))))
    (or (and (window-splittable-p window t)
         ;; Split window horizontally
         (with-selected-window window
           (split-window-right)))
    (and (window-splittable-p window)
         ;; Split window vertically
         (with-selected-window window
           (split-window-below)))
    (and
         ;; If WINDOW is the only usable window on its frame (it is
         ;; the only one or, not being the only one, all the other
         ;; ones are dedicated) and is not the minibuffer window, try
         ;; to split it horizontally disregarding the value of
         ;; `split-height-threshold'.
         (let ((frame (window-frame window)))
           (or
            (eq window (frame-root-window frame))
            (catch 'done
              (walk-window-tree (lambda (w)
                                  (unless (or (eq w window)
                                              (window-dedicated-p w))
                                    (throw 'done nil)))
                                frame)
              t)))
     (not (window-minibuffer-p window))
     (let ((split-width-threshold 0))
       (when (window-splittable-p window t)
         (with-selected-window window
           (split-window-right))))))))

(defun split-window-really-sensibly (&optional window)
  (let ((window (or window (selected-window))))
    (if (> (window-total-width window) (* 2 (window-total-height window)))
        (with-selected-window window (split-window-sensibly-prefer-horizontal window))
      (with-selected-window window (split-window-sensibly window)))))

(setq split-window-preferred-function 'split-window-really-sensibly)

(column-number-mode 1)

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

;;; User interface

;; Get rid of tool bar, menu bar and scroll bars.  On OS X we preserve the menu
;; bar, since the top menu bar is always visible anyway, and we'd just empty it
;; which is rather pointless.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
;; show menu bar
(when (and (eq system-type 'darwin) (fboundp 'menu-bar-mode))
  (menu-bar-mode 1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-default 'truncate-lines t)

(delete-selection-mode 1)
(transient-mark-mode 1)
;; No blinking and beeping, no startup screen, no scratch message and short
;; Yes/No questions.
(blink-cursor-mode -1)
(setq ring-bell-function #'ignore
      inhibit-startup-screen t
      echo-keystrokes 0.1
      linum-format " %d "
      initial-scratch-message "Howdy Partner!")

(fset 'yes-or-no-p #'y-or-n-p)
;; Opt out from the startup message in the echo area by simply disabling this
;; ridiculously bizarre thing entirely.
(fset 'display-startup-echo-area-message #'ignore)

(global-linum-mode)

;; (set-face-attribute 'default nil
;;                     :family "Source Code Pro" :height 160)
(set-face-attribute 'default nil
                    :family "Menlo" :height 140)
(set-face-attribute 'variable-pitch nil
                    :family "Fira Sans" :height 140 :weight 'regular)

(set-frame-parameter nil 'fullscreen 'fullboth)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; utf-8 all the things
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")

;; System setup

;; `gc-cons-threshold'

;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
;;
;; I have a modern machine ;)
;;
(setq gc-cons-threshold 20000000)

(setq delete-old-versions t
      make-backup-files nil
      create-lockfiles nil
      ring-bell-function 'ignore
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(server-start) ;; Allow this Emacs process to be a server for client processes.

(use-package diminish
  :ensure t)

(use-package page-break-lines           ; Turn page breaks into lines
  :ensure t
  :init (global-page-break-lines-mode)
  :diminish page-break-lines-mode)

(use-package cus-edit
  :defer t
  :config
  (setq custom-file raeffu-custom-file
        custom-buffer-done-kill nil            ; Kill when existing
        custom-buffer-verbose-help nil         ; Remove redundant help text
        ;; Show me the real variable name
        custom-unlispify-tag-names nil
        custom-unlispify-menu-entries nil)
  :init (load raeffu-custom-file 'no-error 'no-message))

(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  (show-smartparens-global-mode)
  (dolist (hook '(inferior-emacs-lisp-mode-hook
                  emacs-lisp-mode-hook))
    (add-hook hook #'smartparens-strict-mode))
  :config
  (require 'smartparens-config)
  (setq sp-autoskip-closing-pair 'always)
  :bind
  (:map smartparens-mode-map
	("C-c s u" . sp-unwrap-sexp)
	("C-c s w" . sp-rewrap-sexp))
  :diminish (smartparens-mode))

(use-package hl-line
  :init (global-hl-line-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (dolist (hook '(text-mode-hook prog-mode-hook emacs-lisp-mode-hook))
    (add-hook hook #'rainbow-delimiters-mode)))

(use-package hi-lock
  :init (global-hi-lock-mode))

(use-package highlight-numbers
  :ensure t
  :defer t
  :init (add-hook 'prog-mode-hook #'highlight-numbers-mode))

(use-package rainbow-mode
  :ensure t
  :bind (("C-c t r" . rainbow-mode))
  :config (add-hook 'css-mode-hook #'rainbow-mode)
  :diminish (rainbow-mode))

(use-package company                    ; Graphical (auto-)completion
  :ensure t
  :init (global-company-mode)
  :config
  (progn
    ;; (delete 'company-dabbrev company-backends)
    (setq company-tooltip-align-annotations t
	  company-tooltip-minimum-width 27
	  company-idle-delay 0.3
	  company-tooltip-limit 10
	  company-minimum-prefix-length 3
	  company-tooltip-flip-when-above t
	  company-dabbrev-downcase nil
	  company-dabbrev-ignore-case nil))
  :bind (:map company-active-map
              ("M-k" . company-select-next)
              ("M-i" . company-select-previous)
              ("TAB" . company-complete-selection))
  :diminish company-mode)

(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package tester
  :load-path "~/Projects/tester.el"
  :commands (tester-run-test-file tester-run-test-suite))

(use-package helm
  :ensure t
  :bind (("M-a" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         ("M-p" . helm-projectile-ag)
         ("C-x b" . helm-buffers-list)
         ("C-c b" . helm-resume))
  :bind (:map helm-map
              ("M-i" . helm-previous-line)
              ("M-k" . helm-next-line)
              ("M-I" . helm-previous-page)
              ("M-K" . helm-next-page)
              ("M-h" . helm-beginning-of-buffer)
              ("M-H" . helm-end-of-buffer)
              ("<tab>" . helm-execute-persistent-action)
              ("C-z" . helm-select-action)
              ("C-i" . helm-execute-persistent-action))
  :config (progn
            (setq helm-buffers-fuzzy-matching t)
            (helm-mode 1)
	    (setq helm-split-window-in-side-p           t
		  helm-buffers-fuzzy-matching           t
		  helm-move-to-line-cycle-in-source     t
		  helm-ff-search-library-in-sexp        t
		  helm-ff-file-name-history-use-recentf t
		  helm-ag-fuzzy-match                   t)

	    (substitute-key-definition 'find-tag 'helm-etags-select global-map)
	    (setq projectile-completion-system 'helm))
  ;; Display helm buffers always at the bottom
  ;; Source: http://www.lunaryorn.com/2015/04/29/the-power-of-display-buffer-alist.html
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*helm" (* not-newline) "*" eos)
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.4)))
  :diminish (helm-mode))

(use-package helm-descbinds
  :ensure t
  :bind ("C-h b" . helm-descbinds))

(use-package helm-files
  :bind (:map helm-find-files-map
              ("M-i" . nil)
              ("M-k" . nil)
              ("M-I" . nil)
              ("M-K" . nil)
              ("M-h" . nil)
              ("M-H" . nil)
              ("M-v" . yank)))

(use-package helm-swoop
  :ensure t
  :bind (("M-m" . helm-swoop)
         ("M-M" . helm-swoop-back-to-last-point))
  :bind (:map helm-swoop-map
              ("M-i" . helm-previous-line))
  
  :init
  (bind-key "M-m" 'helm-swoop-from-isearch isearch-mode-map))

(use-package helm-ag
  :ensure helm-ag
  :bind ("M-p" . helm-projectile-ag)
  :commands (helm-ag helm-projectile-ag)
  :init (setq helm-ag-insert-at-point 'symbol
              helm-ag-command-option "--path-to-ignore ~/.agignore"))

(use-package helm-info
  :ensure helm
  :bind (([remap info] . helm-info-at-point)
         ("C-c h e"    . helm-info-emacs))
  :config
  ;; Also lookup symbols in the Emacs manual
  (add-to-list 'helm-info-default-sources
               'helm-source-info-emacs))

(use-package winner                     ; Undo and redo window configurations
  :init (winner-mode))

(use-package desktop                    ; Save buffers, windows and frames
  :disabled t
  :init (desktop-save-mode)
  :config
  ;; Save desktops a minute after Emacs was idle.
  (setq desktop-auto-save-timeout 60)

  ;; Don't save Magit and Git related buffers
  (dolist (mode '(magit-mode magit-log-mode))
    (add-to-list 'desktop-modes-not-to-save mode))
  (add-to-list 'desktop-files-not-to-save (rx bos "COMMIT_EDITMSG")))

;; (use-package autorevert                 ; Auto-revert buffers of changed files
;;   :init (global-auto-revert-mode)
;;   :config
;;   (setq auto-revert-verbose nil         ; Shut up, please!
;;         ;; Revert Dired buffers, too
;;         global-auto-revert-non-file-buffers t)

  ;; (when (eq system-type 'darwin)
  ;;   ;; File notifications aren't supported on OS X
  ;;   (setq auto-revert-use-notify nil))
  ;; :diminish (auto-revert-mode))

(use-package subword                    ; Subword/superword editing
  :defer t
  :diminish subword-mode)

(use-package ibuffer-vc                 ; Group buffers by VC project and status
  :disabled t
  :ensure t
  :defer t
  :init (add-hook 'ibuffer-hook
                  (lambda ()
                    (ibuffer-vc-set-filter-groups-by-vc-root)
                    (unless (eq ibuffer-sorting-mode 'alphabetic)
                      (ibuffer-do-sort-by-alphabetic)))))

(use-package perspective
  :ensure t)

(use-package projectile
  :ensure t
  :bind (("C-p s" . projectile-persp-switch-project))
  :config
  (setq projectile-completion-system 'helm
        projectile-indexing-method 'alien)
  (projectile-global-mode)
  (setq projectile-enable-caching nil)
  :diminish (projectile-mode))

(use-package ibuffer-projectile         ; Group buffers by Projectile project
  :ensure t
  :defer t
  :init (add-hook 'ibuffer-hook #'ibuffer-projectile-set-filter-groups))

(use-package persp-projectile
  :ensure t
  :defer 1
  :bind (("C-p s" . projectile-persp-switch-project))
  :config
  (persp-mode)
  (setq persp-show-modestring nil)
  ;; (defun persp-format-name (name)
  ;;   "Format the perspective name given by NAME for display in `persp-modestring'."
  ;;   (let ((string-name (format "%s" name)))
  ;;     (if (equal name (persp-name persp-curr))
  ;;         (propertize string-name 'face 'persp-selected-face))))

;;   (defun persp-update-modestring ()
;;     "Update `persp-modestring' to reflect the current perspectives.
;; Has no effect when `persp-show-modestring' is nil."
;;     (when persp-show-modestring
;;       (setq persp-modestring
;; 	    (append '("[")
;; 		    (persp-intersperse (mapcar 'persp-format-name (persp-names)) "")
;; 		    '("]")))))
  )

(use-package helm-projectile
  :ensure t
  :bind (("M-t" . helm-projectile-find-file)))

(use-package zoom-window
  :ensure t
  :config
  (zoom-window-setup)
  ;; (setq zoom-window-mode-line-color "#eab700") ;; color-theme-sanityinc-tomorrow
  )

(use-package yasnippet
  :ensure t
  :defer t
  :config
  (yas-global-mode 1)
  ;; (setq yas-snippet-dirs "~/.emacs.d/snippets")
  :diminish (yas-minor-mode . " YS"))

(use-package rspec-mode
  :ensure t
  :defer t
  :config (progn
            (defun rspec-ruby-mode-hook ()
              (tester-init-test-run #'rspec-run-single-file "_spec.rb$")
              (tester-init-test-suite-run #'rake-test))            
            (add-hook 'enh-ruby-mode-hook 'rspec-ruby-mode-hook)
            (yas-global-mode 1))
  :bind (("C-c , s" . rspec-verify-single)
         ("C-c , v" . rspec-verify)))

(add-to-list 'load-path "~/.emacs.d/elpa/Enhanced-Ruby-Mode")
(use-package enh-ruby-mode
  :ensure t
  :defer t
  :mode (("\\.rb\\'"       . enh-ruby-mode)
         ("\\.ru\\'"       . enh-ruby-mode)
         ("\\.jbuilder\\'" . enh-ruby-mode)
         ("\\.gemspec\\'"  . enh-ruby-mode)
         ("\\.rake\\'"     . enh-ruby-mode)
         ("Rakefile\\'"    . enh-ruby-mode)
         ("Gemfile\\'"     . enh-ruby-mode)
         ("Guardfile\\'"   . enh-ruby-mode)
         ("Capfile\\'"     . enh-ruby-mode)
         ("Vagrantfile\\'" . enh-ruby-mode))
  :config (progn
            (setq enh-ruby-indent-level 2
                  enh-ruby-deep-indent-paren nil
                  enh-ruby-bounce-deep-indent t
                  enh-ruby-hanging-indent-level 2)
            (setq ruby-insert-encoding-magic-comment nil)
            (defun rspec--docker-eosce-anal-wrapper (rspec-docker-command rspec-docker-container command)
              "Function for wrapping a command for execution inside a dockerized environment. "
              (format "%s %s sh -c \"%s && %s\"" rspec-docker-command rspec-docker-container "cd /app/server/" command))
            (setq rspec-use-docker-when-possible 1)
            (setq rspec-docker-command "docker-compose exec")))

(use-package rubocop
  :ensure t
  :defer t
  :init (add-hook 'ruby-mode-hook 'rubocop-mode))

(setq exec-path (cons (expand-file-name "~/.rbenv/shims") exec-path))

(use-package rbenv
  :ensure t
  :defer t
  :init (progn
	  (setq rbenv-show-active-ruby-in-modeline nil)
	  (global-rbenv-mode))
  :config (progn
            (global-rbenv-mode)
            (add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)
            ;; (add-hook 'sass-mode-hook 'rbenv-use-corresponding)
            ;; (add-hook 'scss-mode-hook 'rbenv-use-corresponding)
            ))

(use-package f
  :ensure t)

;;; OS X support
(use-package ns-win                     ; OS X window support
  :defer t
  :if (eq system-type 'darwin)
  :config
  (setq ns-pop-up-frames nil            ; Don't pop up new frames from the
                                        ; workspace
        mac-option-modifier 'control       ; Option is simply the natural Meta
        mac-command-modifier 'meta      ; But command is a lot easier to hit
        mac-right-command-modifier 'left
        mac-right-option-modifier 'none ; Keep right option for accented input
        ;; Just in case we ever need these keys
        mac-function-modifier 'hyper))

;;; Environment fixup
(use-package exec-path-from-shell
  :ensure t
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :config
  (progn
    (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell.  A login shell, because my
      ;; environment variables are mostly set in `.zprofile'.
      (setq exec-path-from-shell-arguments '("-l")))

    (dolist (var '("EMAIL" "INFOPATH" "JAVA_OPTS" "GITHUB_PAT"))
      (add-to-list 'exec-path-from-shell-variables var))

    (exec-path-from-shell-initialize)

    (setq user-mail-address (getenv "EMAIL"))

    ;; Re-initialize the `Info-directory-list' from $INFOPATH.  Since package.el
    ;; already initializes info, we need to explicitly add the $INFOPATH
    ;; directories to `Info-directory-list'.  We reverse the list of info paths
    ;; to prepend them in proper order subsequently
    (with-eval-after-load 'info
      (dolist (dir (nreverse (parse-colon-path (getenv "INFOPATH"))))
        (when dir
          (add-to-list 'Info-directory-list dir))))))


(use-package default-text-scale
  :ensure t)

(use-package overseer
  :ensure t
  :init
  (progn
    (defun test-emacs-lisp-hook ()
      (tester-init-test-run #'overseer-test-file "-test.el$")
      (tester-init-test-suite-run #'overseer-test))
    (add-hook 'overseer-mode-hook 'test-emacs-lisp-hook)))

(use-package add-node-modules-path
  :ensure t
  :init
  (add-hook 'typescript-mode-hook #'add-node-modules-path)
  (add-hook 'js-mode-hook #'add-node-modules-path)
  (add-hook 'js2-mode-hook #'add-node-modules-path))

(defun maybe-use-prettier ()
  "Enable prettier-js-mode if an rc file is located."
  (if (or (locate-dominating-file default-directory ".prettierrc.js") (locate-dominating-file default-directory "prettier.config.js"))
      (prettier-js-mode +1)))

(use-package prettier-js
  :ensure t
  :init
  (add-hook 'typescript-mode-hook 'maybe-use-prettier)
  (add-hook 'js2-mode-hook 'maybe-use-prettier)
  )

(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode)))

(use-package helm-flycheck              ; Helm frontend for Flycheck errors
  :ensure t
  :defer t
  :after flycheck)

(use-package flycheck
  :ensure t
  :defer 5
  :init (global-flycheck-mode)
  :config (setq flycheck-temp-prefix ".flycheck")
  :diminish (flycheck-mode))

;; https://www.reddit.com/r/emacs/comments/6w67te/tide_questions_regarding_usepackage/
(use-package tide
  :ensure t
  :bind (:map tide-mode-map
              ("M-w" . tide-rename-symbol)
              ("M-n" . tide-references)
              ("M-'" . tide-documentation-at-point)
              ("M-[" . tide-fix)
              ("C-x o" . tide-organize-imports)
              ("M-e" . company-tide))
  :config (progn
            (
             setq company-tooltip-align-annotations t
                  tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
            )
  (flycheck-add-next-checker 'typescript-tide 'javascript-eslint)
  :init (add-hook 'typescript-mode-hook (lambda()
                                          (flycheck-mode +1)
                                          (setq flycheck-check-syntax-automatically '(save mode-enabled))
                                          (tide-setup)
                                          (eldoc-mode +1)
                                          (tide-hl-identifier-mode +1)
                                          (company-mode +1)))
  :after (company typescript-mode))

(use-package karma
  :ensure t
  :init)

(use-package elisp-slime-nav
  :ensure t
  :init (add-hook 'emacs-lisp-mode-hook #'elisp-slime-nav-mode)
  :diminish elisp-slime-nav-mode)

(use-package emacs-lisp-mode
  :defer t
  :interpreter ("emacs" . emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
              ("C-c e r" . eval-region)
              ("C-c e b" . eval-buffer)
              ("C-c e e" . eval-last-sexp)
              ("C-c e f" . eval-defun))
  :diminish (emacs-lisp-mode . "EL"))

(use-package cask-mode
  :ensure t
  :defer t)

(use-package macrostep
  :ensure t
  :after elisp-mode
  :bind (:map emacs-lisp-mode-map ("C-c m x" . macrostep-expand)
              :map lisp-interaction-mode-map ("C-c m x" . macrostep-expand)))

(use-package ert
  :after elisp-mode)

(use-package web-mode
  :ensure t
  :mode (("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.eex\\'" . web-mode)
         ("\\.php\\'" . web-mode))
  :config (progn
            (setq web-mode-markup-indent-offset 2
                  web-mode-css-indent-offset 2
                  web-mode-attr-indent-offset 2
                  web-mode-code-indent-offset 2)))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.js.erb\\'" . js2-mode)
         ("\\.jsx\\'" . js2-jsx-mode))
  :bind (:map js2-mode-map
	      ("M-j" . backward-char))
  :config (setq js2-basic-offset 2))

(use-package typescript-mode
  :ensure t
  :load-path "~/.emacs.d/elpa/typescript-mode-20191025.1425"
  :config
  (setq typescript-indent-level 2)
 ;; (yas-global-mode 1)
  )

(use-package coffee-mode
  :ensure t
  :mode (("\\.coffee\\'" . coffee-mode)
         ("\\.coffee.erb\\'" . coffee-mode)))

(use-package js2-refactor
  :ensure t
  :after js2-mode
  :init
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c m r"))

(use-package xref-js2
  :ensure t
  :after js2-mode
  :init
  (defun add-xref-js2-backend ()
    (add-hook 'xref-backend-functions
              #'xref-js2-xref-backend nil t))

  (add-hook 'js2-mode-hook #'add-xref-js2-backend))

(use-package company-tern
  :disabled t
  :ensure t
  :after company)

(use-package drag-stuff
  :ensure t
  :config (progn
	  (drag-stuff-define-keys)
	  (drag-stuff-global-mode 1)))

(use-package magit
  :ensure t
  :defer 2
  :bind (("C-x g" . magit-status))
  :config
  (magit-add-section-hook 'magit-status-sections-hook
                          'magit-insert-unpushed-to-upstream
                          'magit-insert-unpushed-to-upstream-or-recent
                          'replace)
  (global-git-commit-mode t)
  )

(use-package yaml-mode
  :ensure t
  :mode (("\\.ya?ml.example\\'" . yaml-mode)
         ("\\.travis.ya?ml\\'" . yaml-mode)
         ("\\.ya?ml\\'" . yaml-mode)))

(use-package emmet-mode
  :ensure t
  :bind (:map emmet-mode-keymap
	      ("M-e" . emmet-expand-line))
  :config (add-hook 'web-mode-hook 'emmet-mode))

(setq exec-path (cons (expand-file-name "~/.rbenv/shims") exec-path))


(use-package scss-mode
  :ensure t
  :mode "\\.scss\\'"
  :init
  (setq scss-compile-at-save nil))

(use-package sass-mode
  :ensure t
  :mode "\\.sass\\'")

(use-package whitespace-cleanup-mode
  :ensure t
  :bind (("C-c t c" . whitespace-cleanup-mode)
         ("C-c x w" . whitespace-cleanup))
  :init (dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
          (add-hook hook #'whitespace-cleanup-mode))
  :diminish (whitespace-cleanup-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c SPC" . ace-jump-mode))

;; (use-package nyan-mode
;;   :ensure t
;;   :config (progn
;; 	    (nyan-mode 1)
;; 	    (nyan-start-animation)
;; 	    (nyan-toggle-wavy-trail)))

;; (use-package matlab-mode
;;   :ensure t)

(use-package ess
 :ensure t)

(use-package csv-mode
  :ensure t)

(use-package diff
  :bind (:map diff-mode-map
	      ("M-k" . next-line)
	      ("M-o" . forward-word)))

(use-package haml-mode
  :ensure t
  :bind ("C-c C-k" . t-comment-or-uncomment-region-or-line))

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

;; (use-package prolog
;;   :ensure t
;;   :mode ("\\.pl" . prolog-mode))

(use-package sh-mode
  :mode ("\\.zsh" . sh-mode))

(use-package elixir-mode
  :ensure t)

(use-package alchemist
  :ensure t)

(use-package wgrep
  :ensure t)

(use-package emojify
  :config (progn
            ;; (add-hook 'after-init-hook #'global-emojify-mode)
            (prettify-symbols-mode t))
  :ensure t)

(use-package buffer-move
  :bind (("<C-up>" . buf-move-up)
         ("<C-down>" . buf-move-down)
         ("<C-left>" . buf-move-left)
         ("<C-right>" . buf-move-right))
  :ensure t)

(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package apache-mode
  :ensure t)

(use-package grip-mode
  :ensure t
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode))
  :config
  (setq grip-github-user "raeffu"))

(use-package gitignore-mode
  :ensure t
  :mode ("\\.gitignore" . gitignore-mode))
;; Themes

(use-package diff-hl
  :ensure t
  :init
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode))

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-one t)
  (progn
    (doom-themes-neotree-config)
    (setq doom-neotree-line-spacing 0)
    (doom-themes-org-config))
  (custom-set-faces
   `(hl-line ((t :background "#354A59")))
   `(linum ((t :weight medium :slant normal :foreground "#bbc2cf" :background "#282c34")))
   `(fringe ((t :foreground "#bbc2cf" :background "#23272e")))
   `(magit-section-highlight ((t :background "#354A59")))
   `(magit-diff-file-heading-highlight ((t :foreground "#c678dd" :background "#354A59")))
   `(magit-diff-hunk-heading-highlight ((t :background "#354A59" :foreground "#a9a1e1")))
   `(magit-diff-hunk-heading ((t :foreground "#a9a1e1")))
   `(magit-diff-added ((t :background "#282c34")))
   `(magit-diff-added-highlight ((t :background "#21242b" :weight normal)))
   `(magit-diff-removed ((t :background "#282c34")))
   `(magit-diff-removed-highlight ((t :background "#21242b" :weight normal)))
   `(smerge-refined-removed ((t :foreground "#ff6c6b" :underline t)))
   `(smerge-refined-added ((t :foreground "#98BE65" :underline t)))
   `(smerge-markers ((t :foreground "#c678dd" :background "#354A59")))
   `(helm-selection ((t :foreground "#51afef" :background "#2E4651" :underline t)))
   `(company-preview ((t :foreground "#5B6268" :background "#21242b")))
   `(tooltip ((t :foreground "#bbc2cf" :background "#23272e" :inverse-video nil)))
   `(company-tooltip ((t :inherit 'tooltip :background nil)))
   `(company-tooltip-selection ((t :weight bold :inverse-video nil :foreground "#8e908c" :background "#2257A0")))
   `(region ((t :background "#2257A0")))
   `(font-lock-comment-face ((t :foreground "#73797e")))
   `(lazy-highlight ((t :background "#9a60ab")))
   `(markdown-header-face ((t :foreground "#51afef")))
   )
  )

;; (use-package doom-themes
;;   :ensure t
;;   :init (load-theme 'doom-one-light t)
;;   (progn
;;     (doom-themes-neotree-config)
;;     (setq doom-neotree-line-spacing 0)
;;     (doom-themes-org-config))
;;   )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'auto)
  (setq doom-modeline-persp-name nil)
  )

(provide 'init)

;;; init.el ends here
