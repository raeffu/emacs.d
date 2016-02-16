(require 'smartparens)
(require 'smartparens-ruby)

;; Do not highlight paren area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay t)
(setq sp-highlight-wrap-tag-overlay t)

(show-smartparens-global-mode)

(provide 'smartparens-prt)
