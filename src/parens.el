(defun copy-sexp ()
  (interactive)
  (save-excursion
    (mark-sexp)
    (kill-ring-save (mark) (point))))

(defun slurp ()
  (interactive)
  (save-excursion
    (backward-up-list)
    (forward-sexp)
    (kill-sexp))
  (yank))

(defun slurp-backwards ()
  (interactive)
  (backward-up-list)
  (down-list)
  (save-excursion
    (backward-up-list)
    (backward-sexp)
    (kill-sexp))
  (yank)
  (insert-char ? ))

(defun setup-paren-keys ()
  (local-set-key (kbd "C-M-m") 'mark-sexp)
  (local-set-key (kbd "C-M-w") 'copy-sexp)
  (local-set-key (kbd "C-)") 'slurp)
  (local-set-key (kbd "C-(") 'slurp-backwards))

(add-hook 'emacs-lisp-mode-hook 'setup-paren-keys)
(add-hook 'scheme-mode-hook 'setup-paren-keys)

(provide 'parens)
