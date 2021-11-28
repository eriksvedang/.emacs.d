;; ~ An experiment in self-sufficiency ~
;; This config has two restrictions:
;; 1. I can't look up anything on the internet.
;; 2. I can't install packages.
;; Let's see how far I get!

(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)
(ido-mode 1)
(savehist-mode 1)
(setq initial-scratch-message "")
(modify-all-frames-parameters '((internal-border-width . 16)))
(add-to-list 'default-frame-alist '(font . "Fira Code-16"))
;;(set-face-attribute 'mode-line nil :box nil :background "#CCC")
(setq line-spacing 5)
(load-theme 'tango)
(global-set-key (kbd "M-o") 'other-window)
(setq delete-active-region t)
(transient-mark-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;(setq lisp-indent-function 'common-lisp-indent-function)

(defun copy-sexp ()
  (interactive)
  (save-excursion
    (mark-sexp)
    (kill-ring-save (mark) (point))))

(add-hook 'emacs-lisp-mode-hook
	  (lambda () (local-set-key (kbd "C-M-w") 'copy-sexp)))

(defun move-line (amount)
  (interactive "nAmount: ")
  ;;(beginning-of-line)
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
