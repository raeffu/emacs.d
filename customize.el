;;; customize.el --- raeffu's customizations

;; Copyright 2015-present, All rights reserved

;; Code licensed under the MIT license

;; Author: raeffu
;; URL: https://github.com/raeffu/.emacs.d

;;; Commentary:

;; My personal customizations file.

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(async-bytecomp-package-mode t)
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(company-dabbrev-char-regexp "\\sw\\|_")
 '(company-dabbrev-code-ignore-case t)
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-etags-ignore-case t)
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 3)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(company-tooltip-align-annotations t)
 '(company-tooltip-flip-when-above t)
 '(company-tooltip-minimum-width 27)
 '(company-transformers nil)
 '(css-indent-offset 2)
 '(current-language-environment "UTF-8")
 '(custom-buffer-indent 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "ac8ec3d2a72c6677e016f6fb1cdb548a5d4514ac162025c13b9f52f44e4c9a3a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "44527270718b7035dcf1931aece1d0fd57f0a08184082f33323c67ea7ed4226e" "9e16b853546abeb9a4491fe7c6fe8edf9440dad652a7fcc6d2fc2ff5151fd682" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "db05a5e4147343b645d8a04124a7ce6d798940c9c0ba07d3a7c7a9000c9670ab" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "76283ea1e0954c0b15a24b63011291886f1425187cf3382f1918db329aca3a75" "8798b2794e779064895ea5b7ca576d8ca503edb24525d540216c937298ee33bd" "513415fb68252d9321e6d5aa9e4f786c07c8ae0095f1da9468f61c7de9ebf506" "65a6a19df0e1b9bbdc9de5509c16a09d731884ad5a24d1d3d9da81bc66a0c33e" "c24c6f648d243610c66ede70123d91f2b6ca7b6204685ef88c51f6e5f48a55dd" "eb56a17bc546d8dbea35b96c5657aaa340a180109ec69ec44c9aab35c4abf210" "d96bb4346cff2e08add9e5d0cab16b89a68c4f715162a97eecf7cfe18e7d7a43" "2b27afbc788d03b374358f3d47eaafa6e6ded51a0bf5a2db428caa08bbfdf76b" "23f5fd194d6942bce1469549f45b86bcc6888a2bdc83342af41061e5e4031c2c" "7e4bb4b0ff477b29fd98a696a1651fbced1e1c9bf96c03ba64ecd0f92cf1794d" "7a49e3e76710bdedec320689e8f66115c620c413a949807d0ec1875e27352885" "4a34df23d3d07a1eec373dce018a62b45d5735104eab27b44fc0a450aacb7fc7" "c662b07b1190a799045c55a0563f5a2c92f42d52d1bbe08226697ee7e19c4c36" "623fa7986f860307fed58d87445b34899772cdbae0e878154444c537608944a9" "589f1e7db06916a7872aa378595372fc3ae1a00f70ff386ff8eccc7023cd468f" "f77b6707a80f56162f03bfdfddca6655a0fe772a46342daa6628621fb4cfa682" "26379708c542126237dff231796e82037732465d4940a6db191d98bee3418875" "48c924b87de50d51d672366b595c3b4c8dd8b762947305c0ff86053f6a276cba" "fb047bd0c42444fd6599678485ed24dc726940ecb716ed9e079e37e97dd1a00f" "322c12997bd0c091a0ba969dceb95e357ba465ba0556747af27c74d8e7f48b40" "0a7952294930e36a5aa8b542f21d29144ca92c6b1114ee80a182a472da8f0fa3" "409ace8e6b289845c719a1f0ea9f899125027cfaee4686cd12091cc3a2ac7a9a" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1dcaccdced8f7fdfe536e2b6c3bb9194c2d707da3a5c63b1a7229e90c4697fec" default)))
 '(delete-selection-mode t)
 '(doom-modeline-vcs-max-length 50)
 '(enh-ruby-bounce-deep-indent t)
 '(enh-ruby-deep-indent-paren nil)
 '(fci-rule-color "#d6d6d6")
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-reekrc ".reek")
 '(flycheck-rubocop-lint-only t)
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(frame-background-mode (quote dark))
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-page-break-lines-mode t nil (page-break-lines))
 '(global-whitespace-cleanup-mode nil)
 '(global-whitespace-mode nil)
 '(global-whitespace-newline-mode nil)
 '(grep-find-ignored-directories
   (quote
    (".cask" "node_modules" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "tmp" "log")))
 '(helm-ag-command-option "--path-to-agignore ~/.agignore" t)
 '(helm-ag-fuzzy-match t t)
 '(helm-ag-insert-at-point (quote symbol) t)
 '(helm-buffer-max-length nil)
 '(helm-buffers-fuzzy-matching t)
 '(helm-ff-file-name-history-use-recentf t)
 '(helm-ff-search-library-in-sexp t)
 '(helm-mode t)
 '(helm-move-to-line-cycle-in-source t)
 '(helm-split-window-inside-p t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-bounce-indent-p nil)
 '(magit-auto-revert-mode t)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(magit-stash-arguments (quote ("--include-untracked")))
 '(magit-status-show-hashes-in-headers t)
 '(magit-wip-after-apply-mode t)
 '(magit-wip-after-save-mode t)
 '(magit-wip-before-change-mode t)
 '(package-build-verbose nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (helm-flycheck projectile tramp perspective elixir-mode scss-mode magit js2-mode f rspec-mode yasnippet gitignore-mode apache-mode dockerfile-mode dockerfile-mod sass-mode doom-modeline buffer-move flycheck tide json-mode emojify wgrep doom-themes all-the-icons color-theme-sanityinc-tomorrow xref-js2 color-theme-sanityinc-solarized persp-mode persp-projectile helm helm-core prettier-js add-node-modules-path whitespace-mode csv-mode dracula-theme moe-theme alchemist solarized-theme cmake-mode ess matlab-mode zoom-window ace-jump-mode yaml-mode whitespace-cleanup-mode web-mode use-package typescript-mode smartparens rubocop rbenv rainbow-mode rainbow-delimiters page-break-lines overseer markdown-mode macrostep karma js2-refactor ibuffer-projectile highlight-numbers helm-swoop helm-projectile helm-descbinds helm-ag exec-path-from-shell erlang enh-ruby-mode emmet-mode elisp-slime-nav drag-stuff default-text-scale company coffee-mode cask-mode ag)))
 '(projectile-globally-ignored-directories
   (quote
    ("vendor/bundle" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "_build" ".cask" "deps" "node_modules" "lib/elixir/_build")))
 '(rbenv-show-active-ruby-in-modeline nil)
 '(safe-local-variable-values
   (quote
    ((rspec-use-docker-when-possible . t)
     (rspec-docker-container . shared)
     (rspec-docker-container . persp)
     (rspec-docker-container . perspectives)
     (rspec-docker-container . app))))
 '(selection-coding-system (quote utf-8))
 '(typescript-indent-level 2)
 '(user-mail-address "raeffu@raeffu.ch")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(whitespace-line-column 95)
 '(zoom-window-mode-line-color ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t :foreground "#5B6268" :background "#21242b")))
 '(company-tooltip ((t :inherit (quote tooltip) :background nil)))
 '(company-tooltip-selection ((t :weight bold :inverse-video nil :foreground "#8e908c" :background "#2257A0")))
 '(fringe ((t :foreground "#bbc2cf" :background "#282c34")))
 '(helm-ff-dotted-directory ((t (:inherit helm-ff-directory))))
 '(helm-selection ((t :foreground "#51afef" :background "#2E4651" :underline t)))
 '(hl-line ((t :background "#354A59")))
 '(linum ((t :weight medium :slant normal :foreground "#bbc2cf" :background "#282c34")))
 '(magit-diff-added ((t :background "#282c34")))
 '(magit-diff-added-highlight ((t :background "#21242b" :weight normal)))
 '(magit-diff-file-heading-highlight ((t :foreground "#c678dd" :background "#354A59")))
 '(magit-diff-hunk-heading ((t :foreground "#8959a8")))
 '(magit-diff-hunk-heading-highlight ((t :foreground "#8959a8" :background "#EFEFEF")))
 '(magit-diff-removed ((t :background "#282c34")))
 '(magit-diff-removed-highlight ((t :background "#21242b" :weight normal)))
 '(magit-section-highlight ((t :background "#354A59")))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :weight bold))))
 '(region ((t :background "#2257A0")))
 '(smerge-markers ((t :foreground "#c678dd" :background "#354A59")))
 '(smerge-refined-added ((t :foreground "#98BE65" :underline t)))
 '(smerge-refined-removed ((t :foreground "#ff6c6b" :underline t)))
 '(tooltip ((t :foreground "#bbc2cf" :background "#23272e" :inverse-video nil))))

;; open zsh scripts with syntax highlighting
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\gitconfig\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
;;; customize.el ends here
