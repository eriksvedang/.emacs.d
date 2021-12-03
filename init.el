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
 '(narrow-to-region 'disabled nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ""))

(modify-all-frames-parameters '((internal-border-width . 16)))

;; Typography
(add-to-list 'default-frame-alist '(font . "Fira Code-16"))
(set-background-color "#FFF")
(set-foreground-color "#000")
(set-face-attribute 'font-lock-comment-face nil :foreground "#F47" :weight 'bold :box nil)
(set-face-attribute 'font-lock-function-name-face nil :foreground "#271C4B")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#0AF")
(set-face-attribute 'font-lock-type-face nil :foreground "#0AF")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#000")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#0AF" :weight 'bold)
(set-face-attribute 'font-lock-string-face nil :foreground "#4BA" :slant 'italic)
(setq line-spacing 5)

;; Completion
(ido-mode 1)
(ido-everywhere t)
(savehist-mode 1)

;; Editing
(delete-selection-mode t)
(transient-mark-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode t)

;; Additional keys
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "<C-return>") 'eval-buffer)
(global-set-key (kbd "s-w") 'kill-this-buffer)

(global-set-key (kbd "M-2") "@")
(global-set-key (kbd "M-4") "$")
(global-set-key (kbd "M-8") "[")
(global-set-key (kbd "M-9") "]")
(global-set-key (kbd "M-(") "{")
(global-set-key (kbd "M-)") "}")
(global-set-key (kbd "M-7") "|")
(global-set-key (kbd "M-/") "\\")

;; Quick config
(defun open-init-file ()
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "C-c ,") 'open-init-file)
(global-set-key (kbd "s-,") 'open-init-file)

;; Load my other code
(add-to-list 'load-path
	     (file-name-as-directory
	      (expand-file-name
	       (concat user-emacs-directory "src"))))
(require 'parens)
(require 'lines)
