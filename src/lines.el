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

(provide 'lines)
