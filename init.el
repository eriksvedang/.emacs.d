;; ~ An experiment in self-sufficiency ~
;; This config has two restrictions:
;; 1. I can't look up anything on the internet.
;; 2. I can't install packages.
;; Let's see how far I get!

;; GUI
(custom-set-variables
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(fringe-mode 0)
 '(initial-scratch-message ""))

(modify-all-frames-parameters '((internal-border-width . 16)))

;; Typography
(add-to-list 'default-frame-alist '(font . "Fira Code-16"))
(setq line-spacing 5)
(load-theme 'tango)
(set-face-attribute 'font-lock-comment-face nil :foreground "#FF99AA" :weight 'bold :box nil)
(set-face-attribute 'font-lock-function-name-face nil :foreground "#271C4B")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#0AF")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#0AF" :weight 'bold)
(set-face-attribute 'font-lock-string-face nil :foreground "#369" :slant 'italic)
;;(set-face-attribute 'mode-line nil :family "Futura" :height 160 :box '(:line-width 10 :color "#ddd"))

;; Completion
(ido-mode 1)
(ido-everywhere t)
(savehist-mode 1)

(defun ido-meta-x ()
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (all-completions "" obarray 'commandp)))))

(global-set-key (kbd "M-x") 'ido-meta-x)

;; Editing
(delete-selection-mode t)
(transient-mark-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode t)

;; Additional keys
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "<C-return>") 'eval-buffer)

;; My functions
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

(defun open-init-file ()
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "s-,") 'open-init-file)

(defun foo (buf)
  (interactive "bSelect a buffer:")
  (message "You selected %s" buf))

(defun bar ()
  (interactive)
  (call-interactively
   (intern (ido-completing-read "Hello?! " '("dired" "calc" "hanoi")))))
