(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(async-bytecomp-package-mode t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "db05a5e4147343b645d8a04124a7ce6d798940c9c0ba07d3a7c7a9000c9670ab" "705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "76283ea1e0954c0b15a24b63011291886f1425187cf3382f1918db329aca3a75" "8798b2794e779064895ea5b7ca576d8ca503edb24525d540216c937298ee33bd" "513415fb68252d9321e6d5aa9e4f786c07c8ae0095f1da9468f61c7de9ebf506" "65a6a19df0e1b9bbdc9de5509c16a09d731884ad5a24d1d3d9da81bc66a0c33e" "c24c6f648d243610c66ede70123d91f2b6ca7b6204685ef88c51f6e5f48a55dd" "eb56a17bc546d8dbea35b96c5657aaa340a180109ec69ec44c9aab35c4abf210" "d96bb4346cff2e08add9e5d0cab16b89a68c4f715162a97eecf7cfe18e7d7a43" "2b27afbc788d03b374358f3d47eaafa6e6ded51a0bf5a2db428caa08bbfdf76b" "23f5fd194d6942bce1469549f45b86bcc6888a2bdc83342af41061e5e4031c2c" "7e4bb4b0ff477b29fd98a696a1651fbced1e1c9bf96c03ba64ecd0f92cf1794d" "7a49e3e76710bdedec320689e8f66115c620c413a949807d0ec1875e27352885" "4a34df23d3d07a1eec373dce018a62b45d5735104eab27b44fc0a450aacb7fc7" "c662b07b1190a799045c55a0563f5a2c92f42d52d1bbe08226697ee7e19c4c36" "623fa7986f860307fed58d87445b34899772cdbae0e878154444c537608944a9" "589f1e7db06916a7872aa378595372fc3ae1a00f70ff386ff8eccc7023cd468f" "f77b6707a80f56162f03bfdfddca6655a0fe772a46342daa6628621fb4cfa682" "26379708c542126237dff231796e82037732465d4940a6db191d98bee3418875" "48c924b87de50d51d672366b595c3b4c8dd8b762947305c0ff86053f6a276cba" "fb047bd0c42444fd6599678485ed24dc726940ecb716ed9e079e37e97dd1a00f" "322c12997bd0c091a0ba969dceb95e357ba465ba0556747af27c74d8e7f48b40" "0a7952294930e36a5aa8b542f21d29144ca92c6b1114ee80a182a472da8f0fa3" "409ace8e6b289845c719a1f0ea9f899125027cfaee4686cd12091cc3a2ac7a9a" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1dcaccdced8f7fdfe536e2b6c3bb9194c2d707da3a5c63b1a7229e90c4697fec" default)))
 '(frame-background-mode (quote dark))
 '(grep-find-ignored-directories
   (quote
    (".cask" "node_modules" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "tmp" "log")))
 '(helm-ag-fuzzy-match t)
 '(magit-auto-revert-mode t)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-rebase-arguments (quote ("--interactive")))
 '(magit-status-show-hashes-in-headers t)
 '(magit-wip-after-apply-mode t)
 '(magit-wip-after-save-mode t)
 '(magit-wip-before-change-mode t)
 '(package-build-verbose nil)
 '(package-enable-at-startup nil)
 '(projectile-globally-ignored-directories
   (quote
    ("vendor/bundle" ".idea" ".eunit" ".git" ".hg" ".fslckout" ".bzr" "_darcs" ".tox" ".svn" "_build" ".cask" "deps" "node_modules" "lib/elixir/_build")))
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "gray" :foreground "black"))))
 '(helm-visible-mark ((t (:background "brightred" :foreground "white"))))
 '(sp-show-pair-match-face ((t (:background "DarkOrange" :foreground "black")))))

;; open zsh scripts with syntax highlighting
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\gitconfig\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
