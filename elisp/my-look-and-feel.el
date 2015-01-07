;; Theme and font
(load-theme 'StripteaseTwo)
(set-face-attribute 'default nil :height 170)
(let ((font "Hasklig")) ;; "Monaco" / "Menlo" / "Hasklig" / "Fira"
  (when (member font (font-family-list))
    (set-face-attribute 'default nil :font font)))

;; Window size and position
(setq-default left-margin-width 0 right-margin-width 0)
;; (set-frame-position (selected-frame) 0 0)
(when window-system
  (set-frame-size (selected-frame) 90 38))

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format (quote "%4d  "))

;; Prettify (replace 'lambda' with the greek symbol, etc)
(global-prettify-symbols-mode 1)

;; Pretty mode
;;(global-pretty-mode 0)

;; Show matching paren
(show-paren-mode 0)

;; Rainbow parens
(require 'rainbow-delimiters)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)

;; Show the color of hex colors inline
(add-hook 'prog-mode-hook 'rainbow-mode)

;; Ace jump!
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "s-j") 'ace-jump-mode)

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Smooth scrolling
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

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
	"*.sh" "*.erl" "*.hs" "*.ml" "*.css" "*.elm"
	"*.c" "*.cpp" "*.cs" "*.m" "*.rs" "*.glsl"))

(provide 'my-look-and-feel)

