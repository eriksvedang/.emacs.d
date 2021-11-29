(defun copy-sexp ()
  (interactive)
  (save-excursion
    (mark-sexp)
    (kill-ring-save (mark) (point))))

(add-hook 'emacs-lisp-mode-hook
	  (lambda () (local-set-key (kbd "C-M-w") 'copy-sexp)))

(defun move-line (amount)
  (interactive "nAmount: ")
  (kill-whole-line)
  (if (< 0 amount)
      (dotimes (i amount)
	(next-line))
    (dotimes (i (- amount))
      (previous-line)))
  (beginning-of-line)
  (yank))

(defun move-line-up ()
  (interactive)
  (move-line -1)
  (previous-line))

(defun move-line-down ()
  (interactive)
  (move-line 1)
  (previous-line))

(global-set-key (kbd "C-s-n") 'move-line-down)
(global-set-key (kbd "C-s-p") 'move-line-up)

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

(global-set-key (kbd "C-)") 'slurp)
(global-set-key (kbd "C-(") 'slurp-backwards)

(provide 'parens)
