;; Theme and font
(load-theme 'Striptease)
(set-face-attribute 'default nil :height 160)
(let ((font "Monaco"))
  (when (member font (font-family-list))
    (set-face-attribute 'default nil :font font)))

;; Window size and position
(setq-default left-margin-width 0 right-margin-width 0)
;(set-frame-position (selected-frame) 0 0)

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d  ")

;; Rainbow parens
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Highlight instances of the same symbol
(idle-highlight-mode 1)

;; Ace jump!
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 10) ;; keyboard scroll one line at a time

(provide 'look-and-feel)

;; Ido
(ido-mode 1)
(ido-ubiquitous 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Smex (Ido completition for M-x menu)
(global-set-key (kbd "M-x") (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

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


