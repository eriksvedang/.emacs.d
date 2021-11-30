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

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-M-w") 'copy-sexp)
	    (local-set-key (kbd "C-)") 'slurp)
	    (local-set-key (kbd "C-(") 'slurp-backwards)
	    (local-set-key (kbd "C-M-m") 'mark-sexp)))

(provide 'parens)
