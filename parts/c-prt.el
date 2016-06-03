(defun custom-c-mode-hook ()
  (global-set-key (kbd "M-j") 'backward-char)
  (global-set-key (kbd "M-l") 'forward-char)
  (global-set-key (kbd "M-i") 'previous-line)
  (global-set-key (kbd "M-I") 'scroll-down)
  (global-set-key (kbd "M-k") 'next-line)
  (global-set-key (kbd "M-K") 'scroll-up)
  (global-set-key (kbd "M-L") 'end-of-line)
  (global-set-key (kbd "M-J") 'beginning-of-line)

  (global-unset-key (kbd "M-b")) ; backward-word
  (global-unset-key (kbd "M-f")) ; forward-word
  (global-set-key (kbd "M-u") 'backward-word)
  (global-set-key (kbd "M-o") 'forward-word)
  (global-set-key (kbd "M-U") 'backward-paragraph)
  (global-set-key (kbd "M-O") 'forward-paragraph)
  (global-set-key (kbd "M-C-o") 'forward-paragraph)
  (global-set-key (kbd "M-C-u") 'backward-paragraph)
  (global-set-key (kbd "M-a") 'helm-M-x))

(add-hook 'c-mode-common-hook 'custom-c-mode-hook)

(provide 'c-prt)
