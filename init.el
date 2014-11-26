(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fcb22adae5636136184233fab651d361c9cb39a6c219f40827853af84dcdb0cf" default))))

;; Package manager
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; Auto install packages
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not"
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

(ensure-package-installed 'rainbow-delimiters
			  'magit
			  'multiple-cursors
			  'rust-mode
			  'haskell-mode
			  'yasnippet
			  'cider
			  'org
			  'rainbow-mode
			  'smartparens
			  'auto-complete
			  'ac-nrepl
			  'powerline)

;; Startup
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;(set-frame-parameter nil 'fullscreen 'fullboth)

;; Paths
(add-to-list 'exec-path "~/bin")

;; Theme and font
(load-theme 'Striptease)
(set-face-attribute 'default nil :height 160)
;; Good fonts: Monaco, Menlo
(let ((font "Monaco"))
  (when (member font (font-family-list))
    (set-face-attribute 'default nil :font font)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF3F60"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#EE9933"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#3fAA90"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#3399EE"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#FF3F60"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EE9933"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#3fAA90"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#3399EE")))))

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
(global-set-key [s-up] 'beginning-of-buffer)
(global-set-key [s-down] 'end-of-buffer)
(global-set-key [s-left] 'beginning-of-line)
(global-set-key [s-right] 'end-of-line)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; Little modes and fixes
(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0)
(setq ring-bell-function 'ignore)
(show-paren-mode 0)
(add-hook 'prog-mode-hook 'rainbow-mode)
(setq initial-scratch-message "")
(setq undo-limit 3600)

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; Ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Auto complete
(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

;; Auto complete nrepl
(require 'ac-nrepl)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

;; Fix meta
(setq mac-option-key-is-meta 0)
(setq mac-option-modifier nil)

;; Better keyboard shortcuts
(global-set-key (kbd "C-o") 'ido-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C--") 'pop-global-mark)

;; Magit
(global-set-key (kbd "C-c C-g") 'magit-status)

;; Cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(global-set-key (kbd "<s-return>") 'cider-eval-buffer)

;; Yasnippets
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; Powerline (customize the 'mode line')
(require 'powerline)

(defun powerline-erik-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-major-mode mode-line)
                                     (powerline-process mode-line)
                                     (powerline-raw "]" mode-line)
                                     (when (buffer-modified-p)
                                       (powerline-raw "[+]" mode-line))
                                     (when buffer-read-only
                                       (powerline-raw "[RO]" mode-line))
                                     (powerline-raw "[%z]" mode-line)
                                     ;; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-minor-modes mode-line)
                                     (powerline-raw "%n" mode-line)
                                     (powerline-raw "]" mode-line)
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw "[" mode-line 'l)
                                                   (powerline-raw (format "%s / %s" backend (vc-working-revision buffer-file-name backend)))
                                                   (powerline-raw "]" mode-line)))))))
                          (rhs (list (powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     (powerline-raw "%l," mode-line 'l)
                                     (powerline-raw (format-mode-line '(10 "%c")))
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(powerline-erik-theme)

(set-face-attribute 'mode-line nil
    :foreground "#fff" :background "#ff3f60"
    :inverse-video nil
    :family "Menlo"
    :box '(:line-width 6 :color "#ff3f60" :style nil))

(set-face-attribute 'mode-line-inactive nil
    :foreground "gray60" :background "gray30"
    :inverse-video nil
    :box '(:line-width 6 :color "gray30" :style nil))

;(set-face-attribute 'mode-line nil :foreground "#fff" :background "#0072b2" :box nil)
;(set-face-attribute 'mode-line-inactive nil :foreground "#666" :background "#050000" :box nil)

;; Smartparens
(add-hook 'prog-mode-hook 'smartparens-mode)
(global-set-key (kbd "C-S-h") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-S-j") 'sp-backward-barf-sexp)
(global-set-key (kbd "C-S-k") 'sp-forward-barf-sexp)
(global-set-key (kbd "C-S-l") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-S-a") 'sp-join-sexp)
(global-set-key (kbd "C-S-s") 'sp-split-sexp)
(global-set-key (kbd "C-S-d") 'sp-kill-sexp)
(global-set-key (kbd "C-S-f") 'sp-splice-sexp)
(global-set-key (kbd "C-S-n") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-S-m") 'sp-end-of-sexp)

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
; C+x 2     Split window up/down
; C+x 3     Split window left/right
; C+x 0     Close current buffer
; C+x b     Open another buffer
; M+x       Run command
; C+s /C+r  Interactive search
; i         Mark for installation
; u         Unmark
; x         Install selected (execute)
; C+n       Next line
; C+p       Prev line
; C+h k     Describe keyboard shortcut
; q         close "pane" (what's the real word?)

;; Magit
;; s to stage files
;; c c to commit (type the message then C-c C-c to actually commit)
;; b b to switch to another branch
;; Other handy keys:
;; P P to do a git push
;; F F to do a git pull

