;; Fix meta
;; (setq mac-option-key-is-meta 0)
;; (setq mac-option-modifier nil)

;; The OSX behaviour for hiding all other windows
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
(global-set-key (kbd "C-x M-l") "λ")

;; Misc keyboard shortcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "s-b") 'ibuffer)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "M-o") 'ace-window) ;; used to be other-window
(global-set-key (kbd "s-W") 'delete-window)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "s-i") 'imenu) ; lists the functions in file
(global-set-key (kbd "s-f") 'rgrep) ; search for files
(global-set-key (kbd "s-+") 'enlarge-window)
(global-set-key (kbd "s--") 'shrink-window)
(global-set-key (kbd "M-+") 'enlarge-window-horizontally)
(global-set-key (kbd "M--") 'shrink-window-horizontally)
(global-set-key (kbd "C-<") 'shell)
(global-set-key (kbd "M-n") 'next-error) ; also works for rgrep results
(global-set-key (kbd "M-p") 'previous-error)

;; Dired
(add-hook 'dired-mode-hook (lambda () (local-set-key (kbd "b") 'dired-up-directory)))

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

;; "Nudge" the buffer up or down
(defun my-scroll-down ()
  (interactive)
  (scroll-up 1))

(defun my-scroll-up ()
  (interactive)
  (scroll-down 1))

(global-set-key [M-s-up] 'my-scroll-down)
(global-set-key [M-s-down]   'my-scroll-up)

;; Expand region (mode)
(global-set-key (kbd "s-e") 'er/expand-region)

;; Google this
(global-set-key (kbd "s-g") 'google-this)

;; Make C-x left and C-x right skip boring buffers
(setq my-skippable-buffers '("*Ibuffer*" "*Messages*" "*Help*"))

(defun my-change-buffer (change-buffer)
  "Call 'change-buffer' until current buffer is not in `my-skippable-buffers'."
  (let ((initial (current-buffer)))
    (funcall change-buffer)
    (let ((first-change (current-buffer)))
      (catch 'loop
        (while (member (buffer-name) my-skippable-buffers)
          (funcall change-buffer)
          (when (eq (current-buffer) first-change)
            (switch-to-buffer initial)
            (throw 'loop t)))))))

(defun my-next-buffer ()
  "`next-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'next-buffer))

(defun my-previous-buffer ()
  "`previous-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'previous-buffer))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)

;; A better version of the built in 'just-one-space'
(defun kill-whitespace ()
  "Kill the whitespace between two non-whitespace characters"
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
        (progn
          (re-search-backward "[^ \t\r\n]" nil t)
          (re-search-forward "[ \t\r\n]+" nil t)
          (replace-match "" nil nil))))))

(global-set-key [s-backspace] 'kill-whitespace)

;; Multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "<s-mouse-1>") 'mc/add-cursor-on-click)
;; If you want to insert a newline in multiple-cursors-mode, use C-j
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-l") 'mc/edit-lines)

(provide 'my-keys)
