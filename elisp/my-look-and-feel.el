;; Theme and font
(load-theme 'StripteaseTwo)
(set-face-attribute 'default nil :height 160)
(let ((font "Monaco"))
  (when (member font (font-family-list))
    (set-face-attribute 'default nil :font font)))

;; Window size and position
(setq-default left-margin-width 0 right-margin-width 0)
;; (set-frame-position (selected-frame) 0 0)

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
;; (setq linum-format " %d  ")
;; (setq linum-format 'dynamic)
(setq linum-format (quote "%4d  "))

;; Prettify (replace 'lambda' with the greek symbol, etc)
(global-prettify-symbols-mode 1)

;; Show matching paren
(show-paren-mode 0)

;; Rainbow parens
(require 'rainbow-delimiters)
(add-hook 'elisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

;; Show the color of hex colors inline
(add-hook 'prog-mode-hook 'rainbow-mode)

;; Highlight instances of the same symbol
;; (idle-highlight-mode 1)

;; Ace jump!
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "s-j") 'ace-jump-mode)

;; C-n adds new line if necessary
;; (setq next-line-add-newlines 1)

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Scroll
;; (setq redisplay-dont-pause t
;;       scroll-margin 1
;;       scroll-step 10
;;       scroll-conservatively 10000
;;       scroll-preserve-screen-position 1)

;; Ido
(ido-mode 1)
(ido-ubiquitous 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-case-fold  t)

;; Smex (Ido completition for M-x menu)
(global-set-key (kbd "M-x") (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

;; Magit
(require 'magit)
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)	  
(global-set-key (kbd "C-x g") 'magit-status)

;; Undo Tree
(undo-tree-mode 1)
(global-set-key (kbd "C-x C-z") 'undo-tree-visualize)

;; Auto complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Find file in project (git repo)
(require 'find-file-in-project)
(global-set-key (kbd "s-p") 'find-file-in-project)
(setq ffip-patterns
      '("*.html" "*.org" "*.txt" "*.md" "*.el"
	"*.clj" "*.cljs" "*.py" "*.rb" "*.js" "*.pl"
	"*.sh" "*.erl" "*.hs" "*.ml" "*.css"
	"*.c" "*.cpp" "*.cs" "*.m"))

;; Smartparens
(require 'smartparens)
(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'html-mode-hook 'smartparens-mode)
(add-hook 'sgml-mode-hook 'smartparens-mode)

(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-M-e") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-u") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-d") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-M-S-d") 'sp-down-sexp)

(define-key sp-keymap (kbd "C-)") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-(") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-)") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-(") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-unwrap-sexp)

(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)
(define-key sp-keymap (kbd "C-M-j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-M-s") 'sp-split-sexp)

;; (global-set-key (kbd "C-S-h") 'sp-backward-slurp-sexp)
;; (global-set-key (kbd "C-S-j") 'sp-backward-barf-sexp)
;; (global-set-key (kbd "C-S-k") 'sp-forward-barf-sexp)
;; (global-set-key (kbd "C-S-l") 'sp-forward-slurp-sexp)
;; (global-set-key (kbd "C-S-a") 'sp-join-sexp)
;; (global-set-key (kbd "C-S-s") 'sp-split-sexp)
;; (global-set-key (kbd "C-S-d") 'sp-kill-sexp)
;; (global-set-key (kbd "C-S-f") 'sp-splice-sexp)
;; (global-set-key (kbd "C-S-n") 'sp-beginning-of-sexp)
;; (global-set-key (kbd "C-S-m") 'sp-end-of-sexp)

(sp-pair "'" nil :actions :rem) ; Don't make the single quote open a pair (smart parens do that by default)

(provide 'my-look-and-feel)

