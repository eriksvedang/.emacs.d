;; Theme and font
(load-theme 'Striptease)
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
(global-prettify-symbols-mode -1)

;; Pretty mode
;;(global-pretty-mode 0)

;; Show matching paren
(show-paren-mode 1)

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
(global-set-key (kbd "<C-escape>") 'company-search-mode)
;(global-set-key (kbd "TAB") #'company-complete)
(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 3)
(setq company-idle-delay 0.4)

;; Find file in project (git repo)
(require 'find-file-in-project)
(global-set-key (kbd "s-p") 'find-file-in-project)
(setq ffip-patterns
      '("*.html" "*.org" "*.txt" "*.md" "*.el" "*.idr"
	"*.clj" "*.cljs" "*.py" "*.rb" "*.js" "*.pl"
	"*.sh" "*.erl" "*.hs" "*.ml" "*.css" "*.elm"
	"*.h" "*.c" "*.cpp" "*.cs" "*.m" "*.rs" "*.glsl"))

;; Org mode
(setq org-support-shift-select t)

(defun my-insert-bullet ()
  (interactive)
  (indent-for-tab-command)
  (insert "- [ ] "))

(global-set-key (kbd "C-c §") 'my-insert-bullet)

;; Flycheck
(add-hook 'rust-mode-hook #'flycheck-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Flymake Cursor (show flymake help at cursor)
(custom-set-variables
 '(help-at-pt-timer-delay 0.9)
 '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Switch to new window when using help
(defadvice describe-key (after move-point-to-new-window activate)
  (other-window 1))

(defadvice describe-function (after move-point-to-new-window activate)
  (other-window 1))

(defadvice describe-variable (after move-point-to-new-window activate)
  (other-window 1))

(defadvice describe-mode (after move-point-to-new-window activate)
  (other-window 1))

(defadvice find-commands-by-name (after move-point-to-new-window activate)
  (other-window 1))

;; Function for finding out info about font at cursor
(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

;; Give numbers syntax highlighting
;;(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; Neotree (IDE-style file view)
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq neo-theme 'ascii)
(custom-set-faces
 '(neo-banner-face ((t . (:inherit shadow))) t)
 '(neo-header-face ((t . (:inherit shadow))) t)
 '(neo-root-dir-face ((t . (:inherit link-visited :underline nil))) t)
 '(neo-dir-link-face ((t . (:inherit dired-directory))) t)
 '(neo-file-link-face ((t . (:inherit default))) t)
 '(neo-button-face ((t . (:inherit dired-directory))) t)
 '(neo-expand-btn-face ((t . (:inherit button))) t))

(setq my-neo-font-size 160)

(custom-set-faces
 (set-face-attribute 'neo-banner-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-header-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-root-dir-face    nil :height my-neo-font-size)
 (set-face-attribute 'neo-button-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-file-link-face   nil :height my-neo-font-size)
 (set-face-attribute 'neo-dir-link-face    nil :height my-neo-font-size)
 (set-face-attribute 'neo-header-face      nil :height my-neo-font-size)
 (set-face-attribute 'neo-expand-btn-face  nil :height my-neo-font-size))

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (set-window-fringes (selected-window) 30 0 nil)))

;; (set-window-fringes (selected-window) 0 0 nil)
;;  :box '(:line-width 12 :color "red" :style nil)


(provide 'my-look-and-feel)

