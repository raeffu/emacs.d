(add-to-list 'load-path "~/Projects/emacs-elixir/")
(add-to-list 'load-path "~/Projects/alchemist.el/")

(require 'elixir-mode)
(require 'alchemist)

(defun t-elixir-mode-hook ()
  (flycheck-mode +1))

(add-hook 'elixir-mode-hook  't-elixir-mode-hook)

(provide 'elixir-prt)
