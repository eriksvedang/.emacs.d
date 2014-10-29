;; Packages
(setq package-enable-at-startup nil)
 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(defvar my-packages '(clojure-mode
		      rainbow-delimiters
                      nrepl
		      haskell-mode
		      solarized-theme
		      multiple-cursors))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Startup
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Paths
(add-to-list 'exec-path "~/bin")

;; Ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Modes
(menu-bar-mode 0)
(tool-bar-mode 0)
(linum-mode 0)
(rainbow-delimiters-mode 1)

;; Nifty keyboard shortcuts
(global-set-key (kbd "C-o") 'ido-switch-buffer)
(global-set-key "\C-x\C-b" 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Fix meta
(setq mac-option-key-is-meta 0)
(setq mac-option-modifier nil)
;(emulate-mac-finnish-keyboard-mode)

;; Cursor
(setq cursor-type 'bar)
(setq-default cursor-type 'bar)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d  ")

;; Theme and font
(load-theme 'dichromacy)
(setq-default left-margin-width 0 right-margin-width 0)
(set-face-attribute 'default nil :height 160)
(when (member "Monaco" (font-family-list))
  (set-face-attribute 'default nil :font "Monaco"))

;; Mouse wheel
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Move lines up and down
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))
 
(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))
   
(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))
 
(global-set-key [\C-\s-up] 'move-text-up)
(global-set-key [\C-\s-down] 'move-text-down)

;; Home/End keyboard shortcuts
(global-set-key [s-left] 'beginning-of-line)
(global-set-key [s-right] 'end-of-line)
(global-set-key [s-down] 'scroll-up-command)
(global-set-key [s-up] 'scroll-down-command)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; Fix emacs strangeness
(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0) 
(setq ring-bell-function 'ignore)
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; Rainbow parens
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Minor mode to ensure key map
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap")
(require 'multiple-cursors)
(define-key my-keys-minor-mode-map (kbd "s-d") 'mc/mark-next-like-this)
(define-key my-keys-minor-mode-map (kbd "s-r") 'compile)
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map) 
(my-keys-minor-mode 1)

;; Notes
; C+g       Cancel
; C+x C+e   Evaluate form
; C+x k     Kill buffer
; C+x 1     Close other buffer
; C+x 2     Split up/down
; C+x 3     Split left/right
; C+x 0     Close current buffer
; C+x b     Open another buffer
; M+x       Run command
; C+s       Interactive search
; i         Mark for installation
; u         Unmark
; x         Install selected (execute)
; C+n       Next line
; C+p       Prev line
; C+h k     Describe keyboard shortcut
; q         close "pane" (what's the real word?)
