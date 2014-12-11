;; Fix meta
;; (setq mac-option-key-is-meta 0)
;; (setq mac-option-modifier nil)

(global-set-key (kbd "M-s-h") 'ns-do-hide-others)
(global-set-key (kbd "M-s-˛") 'ns-do-hide-others)

;; Let me write these characters, plx
(global-set-key (kbd "M-2") "@")
(global-set-key (kbd "M-4") "$")
(global-set-key (kbd "M-8") "[")
(global-set-key (kbd "M-9") "]")
(global-set-key (kbd "M-(") "{")
(global-set-key (kbd "M-)") "}")
(global-set-key (kbd "M-7") "|")
(global-set-key (kbd "M-/") "\\")
(global-set-key (kbd "M-l") "λ")

;; Misc keyboard shortcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C--") 'pop-global-mark)
(global-set-key (kbd "s-i") 'imenu)

;; Shell history
(add-hook 'shell-mode-hook
	  (lambda ()
	    (local-set-key (kbd "<M-up>") 'comint-previous-input)
	    (local-set-key (kbd "<M-down>") 'comint-next-input)))

;; Home/End keyboard shortcuts
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
   Move point to the first non-whitespace character on this line.
   If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [s-left] 'smart-beginning-of-line)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

(global-set-key [s-right] 'end-of-line)
(define-key global-map [end] 'end-of-line)
(global-set-key (kbd "C-e") 'end-of-line)

(global-set-key [s-up] 'beginning-of-buffer)
(global-set-key [s-down] 'end-of-buffer)

;; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "<s-mouse-1>") 'mc/add-cursor-on-click)

;; Minor mode to ensure key map
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap")
(define-key my-keys-minor-mode-map (kbd "s-d") 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "C-c C-l") 'mc/edit-lines)
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)

(provide 'my-keys)
