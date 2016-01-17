(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c662b07b1190a799045c55a0563f5a2c92f42d52d1bbe08226697ee7e19c4c36" "623fa7986f860307fed58d87445b34899772cdbae0e878154444c537608944a9" "589f1e7db06916a7872aa378595372fc3ae1a00f70ff386ff8eccc7023cd468f" "f77b6707a80f56162f03bfdfddca6655a0fe772a46342daa6628621fb4cfa682" "26379708c542126237dff231796e82037732465d4940a6db191d98bee3418875" "48c924b87de50d51d672366b595c3b4c8dd8b762947305c0ff86053f6a276cba" "fb047bd0c42444fd6599678485ed24dc726940ecb716ed9e079e37e97dd1a00f" "322c12997bd0c091a0ba969dceb95e357ba465ba0556747af27c74d8e7f48b40" "0a7952294930e36a5aa8b542f21d29144ca92c6b1114ee80a182a472da8f0fa3" "409ace8e6b289845c719a1f0ea9f899125027cfaee4686cd12091cc3a2ac7a9a" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1dcaccdced8f7fdfe536e2b6c3bb9194c2d707da3a5c63b1a7229e90c4697fec" default)))
 '(grep-find-ignored-directories
   (quote
    (".cask" "node_modules" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "tmp" "log")))
 '(projectile-globally-ignored-directories
   (quote
    ("vendor/bundle" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "_build" ".cask" "deps" "node_modules" "lib/elixir/_build"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "gray" :foreground "black"))))
 '(helm-source-header ((t (:background "color-235" :foreground "color-120" :weight bold))))
 '(helm-visible-mark ((t (:background "brightred" :foreground "white")))))

;; open zsh scripts with syntax highlighting
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\gitconfig\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
